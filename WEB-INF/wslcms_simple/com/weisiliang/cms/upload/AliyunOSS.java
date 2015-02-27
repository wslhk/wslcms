package com.weisiliang.cms.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import com.aliyun.oss.ClientConfiguration;
import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSErrorCode;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.ServiceException;
import com.aliyun.oss.model.AbortMultipartUploadRequest;
import com.aliyun.oss.model.CompleteMultipartUploadRequest;
import com.aliyun.oss.model.GetObjectRequest;
import com.aliyun.oss.model.InitiateMultipartUploadRequest;
import com.aliyun.oss.model.InitiateMultipartUploadResult;
import com.aliyun.oss.model.ListMultipartUploadsRequest;
import com.aliyun.oss.model.MultipartUpload;
import com.aliyun.oss.model.MultipartUploadListing;
import com.aliyun.oss.model.OSSObjectSummary;
import com.aliyun.oss.model.ObjectListing;
import com.aliyun.oss.model.PartETag;
import com.aliyun.oss.model.UploadPartRequest;
import com.aliyun.oss.model.UploadPartResult;
import com.weisiliang.cms.factory.ConfigWSL;
import com.weisiliang.cms.inter.FileUploadProcess;
import com.weisiliang.cms.inter.UpFile;
//import com.weisiliang.cms.upload.OSSMultipartSample.UploadPartThread;

public class AliyunOSS implements FileUploadProcess{

	private static final String ACCESS_ID = ConfigWSL.getMessage("aliyunOss_AccessKeyID");
    private static final String ACCESS_KEY = ConfigWSL.getMessage("aliyunOss_AccessKeySecret");

    private static final String UPLOAD_FILE_PATH = "d:/temp/测试上传大文件.zip";
    private static final String DOWNLOAD_FILE_PATH = "d:/temp/测试下载大文件.zip";
    private static final String OSS_ENDPOINT = "http://oss.aliyuncs.com/";

    private static final long PART_SIZE = 5 * 1024 * 1024L; // 每个Part的大小，最小为5MB
    private static final int CONCURRENCIES = 2; // 上传Part的并发线程数。
    
	@Override
	public void uploadFile(UpFile upFile) {
		
		
		
		 ClientConfiguration config = new ClientConfiguration();
	        OSSClient client = new OSSClient(OSS_ENDPOINT, ACCESS_ID, ACCESS_KEY, config);

	        String bucketName = ACCESS_ID.toLowerCase() + "-multipart-test";
	        bucketName=ConfigWSL.getMessage("aliyunOss_bucketName");
	        String key = "cmstest/"+upFile.getSavePath();

	        File uploadFile = upFile.getFile();
	        if (!uploadFile.exists())
	            System.err.println("无法找到文件：" + upFile.getFile());

	        // 准备Bucket
	        ensureBucket(client, bucketName);

	        try {
//	            System.out.println("正在上传...");
	            // 使用multipart的方式上传文件
//	        	upload
	            uploadBigFile(client, bucketName, key, uploadFile);

//	            System.out.println("正在下载...");
	            // 下载上传完成的Object
//	            downloadFile(client, bucketName, key, DOWNLOAD_FILE_PATH);
	        } catch(Exception e){
	        	e.printStackTrace();
	        }finally {
	            // 清理测试资源
//	            deleteBucket(client, bucketName);
	        }
	}
	

	@Override
	public void removeFile(UpFile upFile) {
		 ClientConfiguration config = new ClientConfiguration();
	        OSSClient client = new OSSClient(OSS_ENDPOINT, ACCESS_ID, ACCESS_KEY, config);
	        String bucketName=ConfigWSL.getMessage("aliyunOss_bucketName");
	        String key = "cmstest/"+upFile.getSavePath();
	        client.deleteObject(bucketName, key);
	     
	       
	       
		
	}
	
	

    // 创建Bucket
    private static void ensureBucket(OSSClient client, String bucketName)
            throws OSSException, ClientException{

        try {
            // 创建bucket
            client.createBucket(bucketName);
        } catch (ServiceException e) {
            if (!OSSErrorCode.BUCKES_ALREADY_EXISTS.equals(e.getErrorCode())) {
                // 如果Bucket已经存在，则忽略
                throw e;
            }
        }
    }

    // 删除掉Bucket
    private static void deleteBucket(OSSClient client, String bucketName)
            throws OSSException, ClientException{

        //删除bucket之前必须保证bucket为空，所以先必须先删除object和multipart

        // 如果存在，查看bucket是否为空
        ObjectListing ObjectListing = client.listObjects(bucketName);
        List<OSSObjectSummary> listDeletes = ObjectListing.getObjectSummaries();
        for (int i = 0; i < listDeletes.size(); i++) {
            String objectName = listDeletes.get(i).getKey();
            // 如果不为空，先删除bucket下的文件
            client.deleteObject(bucketName, objectName);
        }

        // 删除所有未完成的multipart uploads.
        ListMultipartUploadsRequest listMultipartUploadsRequest =
                new ListMultipartUploadsRequest(bucketName);
        MultipartUploadListing uploadListing =
                client.listMultipartUploads(listMultipartUploadsRequest);

        for (MultipartUpload upload : uploadListing.getMultipartUploads()){
            String key = upload.getKey();
            AbortMultipartUploadRequest abortMultipartUploadRequest=
                    new AbortMultipartUploadRequest(
                            bucketName, key, upload.getUploadId());

            client.abortMultipartUpload(abortMultipartUploadRequest);
        }

        // 删除bucket
        client.deleteBucket(bucketName);
    }

    // 通过Multipart的方式上传一个大文件
    // 要上传文件的大小必须大于一个Part允许的最小大小，即5MB。
    private static void uploadBigFile(OSSClient client, String bucketName, String key,
            File uploadFile) throws OSSException, ClientException, InterruptedException {

        int partCount = calPartCount(uploadFile);
//        if (partCount <= 1) {
//            throw new IllegalArgumentException(
//                    "要上传文件的大小必须大于一个Part的字节数：" + PART_SIZE);
//        }

        String uploadId = initMultipartUpload(client, bucketName, key);

        ExecutorService pool = Executors.newFixedThreadPool(CONCURRENCIES);

        List<PartETag> eTags = Collections.synchronizedList(new ArrayList<PartETag>());

        for (int i = 0; i < partCount; i++) {
            long start = PART_SIZE * i;
            long curPartSize = PART_SIZE < uploadFile.length() - start ?
                    PART_SIZE : uploadFile.length() - start;

            pool.execute(new UploadPartThread(client, bucketName, key,
                    uploadFile, uploadId, i + 1,
                    PART_SIZE * i, curPartSize, eTags));
        }

        pool.shutdown();
        while (!pool.isTerminated()) {
            pool.awaitTermination(5, TimeUnit.SECONDS);
        }

        if (eTags.size() != partCount)
        {
            throw new IllegalStateException("Multipart上传失败，有Part未上传成功。");
        }

        completeMultipartUpload(client, bucketName, key, uploadId, eTags);
    }

    // 根据文件的大小和每个Part的大小计算需要划分的Part个数。
    private static int calPartCount(File f) {
        int partCount = (int) (f.length() / PART_SIZE);
        if (f.length() % PART_SIZE != 0){
            partCount++;
        }
        return partCount;
    }

    // 初始化一个Multi-part upload请求。
    private static String initMultipartUpload(OSSClient client,
            String bucketName, String key) throws OSSException, ClientException {
        InitiateMultipartUploadRequest initUploadRequest =
                new InitiateMultipartUploadRequest(bucketName, key);
        InitiateMultipartUploadResult initResult =
                client.initiateMultipartUpload(initUploadRequest);
        String uploadId = initResult.getUploadId();
        return uploadId;
    }

    // 完成一个multi-part请求。
    private static void completeMultipartUpload(OSSClient client,
            String bucketName, String key, String uploadId, List<PartETag> eTags)
                    throws OSSException, ClientException {
        //为part按partnumber排序
        Collections.sort(eTags, new Comparator<PartETag>(){

            public int compare(PartETag arg0, PartETag arg1) {
                PartETag part1= arg0;
                PartETag part2= arg1;

                return part1.getPartNumber() - part2.getPartNumber();
            }  
        });

        CompleteMultipartUploadRequest completeMultipartUploadRequest =
                new CompleteMultipartUploadRequest(bucketName, key, uploadId, eTags);

        client.completeMultipartUpload(completeMultipartUploadRequest);
    }

    private static class UploadPartThread implements Runnable {
        private File uploadFile;
        private String bucket;
        private String object;
        private long start;
        private long size;
        private List<PartETag> eTags;
        private int partId;
        private OSSClient client;
        private String uploadId;

        UploadPartThread(OSSClient client,String bucket, String object,
                File uploadFile,String uploadId, int partId,
                long start, long partSize, List<PartETag> eTags) {
            this.uploadFile = uploadFile;
            this.bucket = bucket;
            this.object = object;
            this.start = start;
            this.size = partSize;
            this.eTags = eTags;
            this.partId = partId;
            this.client = client;
            this.uploadId = uploadId;
        }

        @Override
        public void run() {

            InputStream in = null;
            try {
                in = new FileInputStream(uploadFile);
                in.skip(start);

                UploadPartRequest uploadPartRequest = new UploadPartRequest();
                uploadPartRequest.setBucketName(bucket);
                uploadPartRequest.setKey(object);
                uploadPartRequest.setUploadId(uploadId);
                uploadPartRequest.setInputStream(in);
                uploadPartRequest.setPartSize(size);
                uploadPartRequest.setPartNumber(partId);

                UploadPartResult uploadPartResult = client.uploadPart(uploadPartRequest);

                eTags.add(uploadPartResult.getPartETag());

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (in != null) try { in.close(); } catch (Exception e) {}
            }
        }
    }

    // 下载Object到本地文件。
    private static void downloadFile(OSSClient client,
            String bucketName, String key, String downloadFilePath)
                    throws OSSException, ClientException {
        client.getObject(new GetObjectRequest(bucketName, key),
                new File(downloadFilePath));
    }




}

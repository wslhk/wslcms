package cn.ifenghui.service.sdk.json;

public interface JSONErrorListener {
    void start(String text);
    void error(String message, int column);
    void end();
}

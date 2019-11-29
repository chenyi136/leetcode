package main.com.chenyi.entity;

public class Picture {
    private int id;
    private String picName;
    private String content;

    public String getPicName() {
        return picName;
    }

    public void setPicName(String picName) {
        this.picName = picName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Picture{" +
                "id=" + id +
                ", picName='" + picName + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}

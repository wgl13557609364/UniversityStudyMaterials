package cn.fuchsine.pojo;

/**
 * @author fuchsine
 * @date 2022/10/15 20:09
 * @since 1.0.0
 */
public class Item {
    private int orderNum;
    private int orderId;
    private int articleId;

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    @Override
    public String toString() {
        return "Item{" +
                "orderNum=" + orderNum +
                ", orderId=" + orderId +
                ", articleId=" + articleId +
                '}';
    }
}

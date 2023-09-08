package cn.fuchsine.pojo;

/**
 * @author fuchsine
 * @date 2022/10/16 3:42
 * @since 1.0.0
 */
public class Collect {
    private int id;
    private int articleId;
    private int userId;
    private Article article;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    @Override
    public String toString() {
        return "Collect{" +
                "id=" + id +
                ", articleId=" + articleId +
                ", userId=" + userId +
                ", article=" + article +
                '}';
    }
}

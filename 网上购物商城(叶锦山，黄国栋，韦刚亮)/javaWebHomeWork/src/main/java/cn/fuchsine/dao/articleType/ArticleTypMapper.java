package cn.fuchsine.dao.articleType;

import cn.fuchsine.pojo.ArticleType;

import java.util.List;

/**
 * @author fuchsine
 * @date 2022/9/30 17:15
 * @since 1.0.0
 */
public interface ArticleTypMapper {
    List<ArticleType> getListArticleType();
    ArticleType findyByremark(String remark);

}

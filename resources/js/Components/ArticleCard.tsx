import React from 'react';

export interface ArticleSummary {
  id: string | number;
  title: string;
  image?: string;
  readingTime: string;
  author: string;
}

const ArticleCard: React.FC<{ article: ArticleSummary }> = ({ article }) => (
  <a
    href={`/articles/${article.id}`}
    className="block rounded-lg overflow-hidden focus:outline-none focus:ring-2 focus:ring-brand-primary"
  >
    {article.image && (
      <img src={article.image} alt="" className="w-full h-40 object-cover" />
    )}
    <div className="p-4 space-y-1">
      <h3 className="font-medium text-sm">{article.title}</h3>
      <p className="text-xs text-text-muted">
        {article.author} · {article.readingTime}
      </p>
    </div>
  </a>
);

export default ArticleCard;

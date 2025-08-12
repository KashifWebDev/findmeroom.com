import React from 'react';
import Navbar from '@/Components/Navbar';
import Footer from '@/Components/Footer';
import ArticleCard, { ArticleSummary } from '@/Components/ArticleCard';

interface Props {
  items: ArticleSummary[];
}

const ArticlesIndex: React.FC<Props> = ({ items }) => (
  <div className="min-h-screen flex flex-col">
    <Navbar />
    <main className="flex-1 p-4">
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        {items.map((a) => (
          <ArticleCard key={a.id} article={a} />
        ))}
      </div>
    </main>
    <Footer />
  </div>
);

export default ArticlesIndex;

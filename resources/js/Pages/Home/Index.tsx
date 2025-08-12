import React from 'react';
import Navbar from '@/Components/Navbar';
import Footer from '@/Components/Footer';

const Home: React.FC = () => {
  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      <main className="flex-1 p-4 space-y-8">
        <section className="text-center py-10 space-y-4">
          <h1 className="text-2xl font-bold">Find your room</h1>
          <form className="max-w-md mx-auto flex gap-2" onSubmit={(e) => e.preventDefault()}>
            <input className="flex-1 border rounded p-2" placeholder="Location" />
            <button className="px-4 py-2 bg-brand-primary text-white rounded">Search</button>
          </form>
        </section>
        <section>
          <h2 className="font-semibold mb-2">Trending</h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {[1, 2, 3].map((i) => (
              <div key={i} className="h-32 bg-surface-1 rounded animate-pulse" />
            ))}
          </div>
        </section>
        <section>
          <h2 className="font-semibold mb-2">Articles</h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {[1, 2].map((i) => (
              <div key={i} className="h-32 bg-surface-1 rounded animate-pulse" />
            ))}
          </div>
        </section>
      </main>
      <Footer />
    </div>
  );
};

export default Home;

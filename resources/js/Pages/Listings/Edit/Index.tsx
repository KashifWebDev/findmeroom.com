import React from 'react';
import Navbar from '@/Components/Navbar';
import Footer from '@/Components/Footer';

const ListingEdit: React.FC = () => (
  <div className="min-h-screen flex flex-col">
    <Navbar />
    <main className="flex-1 p-4">
      <p>Edit listing form goes here.</p>
    </main>
    <Footer />
  </div>
);

export default ListingEdit;

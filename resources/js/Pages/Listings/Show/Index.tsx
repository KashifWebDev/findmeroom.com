import React from 'react';
import Navbar from '@/Components/Navbar';
import Footer from '@/Components/Footer';
import ListingCard, { ListingCardProps } from '@/Components/ListingCard';
import PriceCurrency from '@/Components/PriceCurrency';
import MapPreview from '@/Components/MapPreview';

interface Props {
  listing: ListingCardProps & { description?: string };
  similar: ListingCardProps[];
}

const ListingShow: React.FC<Props> = ({ listing, similar }) => (
  <div className="min-h-screen flex flex-col">
    <Navbar />
    <main className="flex-1 p-4 space-y-4">
      <div className="aspect-video bg-surface-1 rounded" />
      <h1 className="text-xl font-semibold">{listing.title}</h1>
      <PriceCurrency amount={listing.price} currency={listing.currency} />
      <p>{listing.description}</p>
      <MapPreview />
      <button className="px-4 py-2 bg-brand-primary text-white rounded">Contact host</button>
      <section>
        <h2 className="font-semibold mb-2">Similar rooms</h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
          {similar.map((l) => (
            <ListingCard key={l.id} listing={l} />
          ))}
        </div>
      </section>
    </main>
    <Footer />
  </div>
);

export default ListingShow;

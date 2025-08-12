import React from 'react';
import { Link } from '@inertiajs/react';
import PriceCurrency from './PriceCurrency';

export interface ListingCardProps {
  id: number | string;
  title: string;
  price: number;
  currency: string;
  location: string;
  type: string;
  image?: string;
}

const ListingCard: React.FC<{ listing: ListingCardProps }> = ({ listing }) => {
  return (
    <Link
      href={`/listings/${listing.id}`}
      className="block rounded-lg overflow-hidden focus:outline-none focus:ring-2 focus:ring-brand-primary transition-transform duration-200 hover:-translate-y-0.5 hover:shadow-md"
    >
      <div className="aspect-video bg-surface-1">
        {listing.image && (
          <img src={listing.image} alt="" className="w-full h-full object-cover" />
        )}
      </div>
      <div className="p-4 space-y-1">
        <h3 className="font-medium text-sm">{listing.title}</h3>
        <PriceCurrency amount={listing.price} currency={listing.currency} />
        <p className="text-xs text-text-muted">
          {listing.location} – {listing.type}
        </p>
      </div>
    </Link>
  );
};

export default ListingCard;

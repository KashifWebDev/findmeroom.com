import React, { useState } from 'react';
import Navbar from '@/Components/Navbar';
import Footer from '@/Components/Footer';
import ListingCard, { ListingCardProps } from '@/Components/ListingCard';
import ListingFilters, { Filters } from '@/Components/ListingFilters';
import Pagination from '@/Components/Pagination';
import OnboardingTour from '@/Components/OnboardingTour';

interface Props {
  items: ListingCardProps[];
  filters: Filters;
  pagination: { page: number; total: number };
}

const ListingsIndex: React.FC<Props> = ({ items = [], filters, pagination }) => {
  const [current, setCurrent] = useState<Filters>(filters);

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      <div className="flex flex-1">
        <aside className="hidden md:block w-64 p-4">
          <ListingFilters
            value={current}
            onChange={setCurrent}
            onApply={() => {}}
            onReset={() => setCurrent(filters)}
          />
        </aside>
        <main className="flex-1 p-4 space-y-4">
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {items.map((l) => (
              <ListingCard key={l.id} listing={l} />
            ))}
          </div>
          <Pagination page={pagination.page} total={pagination.total} onChange={() => {}} />
        </main>
      </div>
      <Footer />
      <OnboardingTour id="listings-index" steps={[<p>Browse rooms</p>, <p>Apply filters</p>, <p>View details</p>]} />
    </div>
  );
};

export default ListingsIndex;

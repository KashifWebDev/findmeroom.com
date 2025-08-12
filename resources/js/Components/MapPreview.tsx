import React, { lazy, Suspense } from 'react';

const LazyMap = lazy(() => Promise.resolve({ default: () => <div className="w-full h-full" /> }));

const MapPreview: React.FC = () => {
  return (
    <div className="h-48 w-full bg-surface-2 rounded">
      <Suspense fallback={<div className="flex items-center justify-center h-full text-sm">Loading map...</div>}>
        <LazyMap />
      </Suspense>
    </div>
  );
};

export default MapPreview;

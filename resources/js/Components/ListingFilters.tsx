import React, { useEffect, useState } from 'react';

export interface Filters {
  keyword: string;
  location: string;
  radius: number;
  types: string[];
  priceMin?: number;
  priceMax?: number;
  currency: string;
}

interface Props {
  value: Filters;
  onChange: (value: Filters) => void;
  onApply: () => void;
  onReset: () => void;
}

const ListingFilters: React.FC<Props> = ({ value, onChange, onApply, onReset }) => {
  const [keyword, setKeyword] = useState(value.keyword);

  useEffect(() => {
    const t = setTimeout(() => {
      onChange({ ...value, keyword });
    }, 300);
    return () => clearTimeout(t);
  }, [keyword, onChange, value]);

  return (
    <form
      onSubmit={(e) => {
        e.preventDefault();
        onApply();
      }}
      className="space-y-4"
    >
      <div>
        <label className="block text-sm mb-1">Keyword</label>
        <input
          type="text"
          value={keyword}
          onChange={(e) => setKeyword(e.target.value)}
          className="w-full border rounded p-2"
        />
      </div>
      <div>
        <label className="block text-sm mb-1">Location</label>
        <input
          type="text"
          value={value.location}
          onChange={(e) => onChange({ ...value, location: e.target.value })}
          className="w-full border rounded p-2"
        />
      </div>
      <div className="flex gap-2">
        <div className="flex-1">
          <label className="block text-sm mb-1">Radius (km)</label>
          <input
            type="number"
            value={value.radius}
            onChange={(e) => onChange({ ...value, radius: Number(e.target.value) })}
            className="w-full border rounded p-2"
          />
        </div>
        <div className="flex-1">
          <label className="block text-sm mb-1">Type</label>
          <select
            multiple
            value={value.types}
            onChange={(e) =>
              onChange({
                ...value,
                types: Array.from(e.target.selectedOptions).map((o) => o.value),
              })
            }
            className="w-full border rounded p-2 h-24"
          >
            <option value="student">Student</option>
            <option value="hostel">Hostel</option>
            <option value="emergency">Emergency</option>
            <option value="sublet">Sublet</option>
            <option value="private">Private room</option>
          </select>
        </div>
      </div>
      <div className="flex gap-2">
        <div className="flex-1">
          <label className="block text-sm mb-1">Price Min</label>
          <input
            type="number"
            value={value.priceMin ?? ''}
            onChange={(e) => onChange({ ...value, priceMin: e.target.value ? Number(e.target.value) : undefined })}
            className="w-full border rounded p-2"
          />
        </div>
        <div className="flex-1">
          <label className="block text-sm mb-1">Price Max</label>
          <input
            type="number"
            value={value.priceMax ?? ''}
            onChange={(e) => onChange({ ...value, priceMax: e.target.value ? Number(e.target.value) : undefined })}
            className="w-full border rounded p-2"
          />
        </div>
        <div className="flex-1">
          <label className="block text-sm mb-1">Currency</label>
          <select
            value={value.currency}
            onChange={(e) => onChange({ ...value, currency: e.target.value })}
            className="w-full border rounded p-2"
          >
            <option value="USD">USD</option>
            <option value="EUR">EUR</option>
            <option value="GBP">GBP</option>
          </select>
        </div>
      </div>
      <div className="flex gap-2">
        <button type="submit" className="px-4 py-2 bg-brand-primary text-white rounded">
          Apply
        </button>
        <button type="button" onClick={onReset} className="px-4 py-2 border rounded">
          Reset
        </button>
      </div>
    </form>
  );
};

export default ListingFilters;

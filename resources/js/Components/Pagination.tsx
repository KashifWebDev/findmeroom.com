import React from 'react';

interface Props {
  page: number;
  total: number;
  onChange: (page: number) => void;
}

const Pagination: React.FC<Props> = ({ page, total, onChange }) => {
  return (
    <nav className="flex items-center gap-2" aria-label="Pagination">
      <button
        className="px-3 py-1 border rounded disabled:opacity-50"
        onClick={() => onChange(page - 1)}
        disabled={page <= 1}
      >
        Prev
      </button>
      <span className="text-sm">
        {page} / {total}
      </span>
      <button
        className="px-3 py-1 border rounded disabled:opacity-50"
        onClick={() => onChange(page + 1)}
        disabled={page >= total}
      >
        Next
      </button>
    </nav>
  );
};

export default Pagination;

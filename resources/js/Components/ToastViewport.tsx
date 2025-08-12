import React, { useEffect, useState } from 'react';

export interface Toast {
  id: number;
  message: string;
  type?: 'success' | 'error';
}

let id = 0;
const listeners: ((t: Toast) => void)[] = [];

export const showToast = (toast: Omit<Toast, 'id'>) => {
  const t = { ...toast, id: ++id };
  listeners.forEach((l) => l(t));
};

const ToastViewport: React.FC = () => {
  const [toasts, setToasts] = useState<Toast[]>([]);
  useEffect(() => {
    const l = (t: Toast) => setToasts((prev) => [...prev, t]);
    listeners.push(l);
    return () => {
      const idx = listeners.indexOf(l);
      if (idx >= 0) listeners.splice(idx, 1);
    };
  }, []);

  return (
    <div className="fixed top-0 right-0 z-50 p-4 space-y-2 pointer-events-none">
      {toasts.map((t) => (
        <div
          key={t.id}
          className={`pointer-events-auto rounded p-2 shadow bg-surface-1 ${
            t.type === 'error' ? 'text-error' : 'text-success'
          }`}
        >
          {t.message}
        </div>
      ))}
    </div>
  );
};

export default ToastViewport;

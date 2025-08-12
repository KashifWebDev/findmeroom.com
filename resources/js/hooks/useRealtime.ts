import { useEffect } from 'react';

export type RealtimeCallback<T = unknown> = (payload: T) => void;

export function emitRealtime<T>(channel: string, payload: T) {
  window.dispatchEvent(new CustomEvent(channel, { detail: payload }));
}

export function useRealtime<T = unknown>(channel: string, cb: RealtimeCallback<T>) {
  useEffect(() => {
    const handler = (e: Event) => cb(((e as CustomEvent<T>).detail));
    window.addEventListener(channel, handler);
    return () => window.removeEventListener(channel, handler);
  }, [channel, cb]);
}

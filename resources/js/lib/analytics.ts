export function track(event: string, data?: Record<string, unknown>) {
  if (import.meta.env.DEV) {
     
    console.log('track', event, data);
  }
}

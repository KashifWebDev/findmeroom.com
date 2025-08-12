export async function uploadImage(file: File): Promise<string> {
  // mock upload delay
  await new Promise((res) => setTimeout(res, 300));
  return URL.createObjectURL(file);
}

export async function fetchListings() {
  return [];
}

export async function fetchArticles() {
  return [];
}

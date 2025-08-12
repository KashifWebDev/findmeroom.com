import React, { useState } from 'react';
import { z } from 'zod';
import Navbar from '@/Components/Navbar';
import Footer from '@/Components/Footer';
import PhotoUploader from '@/Components/PhotoUploader';
import { showToast } from '@/Components/ToastViewport';
import OnboardingTour from '@/Components/OnboardingTour';

const schema = z.object({
  title: z.string().min(1),
  type: z.string().min(1),
  description: z.string().min(1),
});

const ListingCreate: React.FC = () => {
  const [step, setStep] = useState(0);
  interface FormData { title?: string; type?: string; description?: string; photos?: string[]; }
  const [data, setData] = useState<FormData>({});

  const next = () => setStep((s) => s + 1);
  const prev = () => setStep((s) => s - 1);
  const publish = () => {
    const result = schema.safeParse(data);
    if (!result.success) {
      showToast({ message: 'Please fill all fields', type: 'error' });
      return;
    }
    showToast({ message: 'Listing saved', type: 'success' });
  };

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      <main className="flex-1 p-4">
        {step === 0 && (
          <div className="space-y-2">
            <input
              className="border p-2 w-full"
              placeholder="Title"
              value={data.title || ''}
              onChange={(e) => setData({ ...data, title: e.target.value })}
            />
            <select
              className="border p-2 w-full"
              value={data.type || ''}
              onChange={(e) => setData({ ...data, type: e.target.value })}
            >
              <option value="">Select type</option>
              <option value="private">Private room</option>
              <option value="hostel">Hostel</option>
            </select>
            <textarea
              className="border p-2 w-full"
              placeholder="Description"
              value={data.description || ''}
              onChange={(e) => setData({ ...data, description: e.target.value })}
            />
            <button onClick={next} className="mt-2 px-4 py-2 bg-brand-primary text-white rounded">
              Next
            </button>
          </div>
        )}
        {step === 1 && (
          <div className="space-y-4">
            <PhotoUploader onUpload={(urls: string[]) => setData({ ...data, photos: urls })} />
            <div className="flex gap-2">
              <button onClick={prev} className="px-4 py-2 border rounded">
                Back
              </button>
              <button onClick={publish} className="px-4 py-2 bg-brand-primary text-white rounded">
                Publish
              </button>
            </div>
          </div>
        )}
      </main>
      <Footer />
      <OnboardingTour id="listings-create" steps={[<p>Basics</p>, <p>Photos</p>, <p>Publish</p>]} />
    </div>
  );
};

export default ListingCreate;

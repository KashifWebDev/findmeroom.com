import React, { useCallback, useRef, useState } from 'react';
import { uploadImage } from '../lib/api';

interface Props {
  onUpload: (urls: string[]) => void;
}

const PhotoUploader: React.FC<Props> = ({ onUpload }) => {
  const inputRef = useRef<HTMLInputElement>(null);
  const [previews, setPreviews] = useState<string[]>([]);

  const handleFiles = useCallback(
    async (files: FileList | null) => {
      if (!files) return;
      const list = Array.from(files);
      const urls: string[] = [];
      for (const file of list) {
        setPreviews((p) => [...p, URL.createObjectURL(file)]);
        urls.push(await uploadImage(file));
      }
      onUpload(urls);
    },
    [onUpload]
  );

  return (
    <div>
      <div
        className="border-2 border-dashed p-4 text-center rounded cursor-pointer"
        onClick={() => inputRef.current?.click()}
      >
        <p>Drag and drop photos or click to upload</p>
        <input
          ref={inputRef}
          type="file"
          multiple
          accept="image/*"
          className="hidden"
          onChange={(e) => handleFiles(e.target.files)}
        />
      </div>
      {previews.length > 0 && (
        <ul className="mt-4 grid grid-cols-3 gap-2">
          {previews.map((src, i) => (
            <li key={i} className="aspect-square bg-surface-1 rounded overflow-hidden">
              <img src={src} alt="" className="w-full h-full object-cover" />
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default PhotoUploader;

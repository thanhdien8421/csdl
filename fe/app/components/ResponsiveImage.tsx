import * as React from "react";
import { ImageProps } from "../../types";
import Image from "next/image";
export const ResponsiveImage: React.FC<ImageProps> = ({ 
    src, 
    alt, 
    className = "",
    priority = false 
  }) => {
    return (
      <div className={`relative w-full ${className}`}>
        <Image
          src={src}
          alt={alt}
          fill
          className="object-contain"
          priority={priority}
          sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
        />
      </div>
    );
  };
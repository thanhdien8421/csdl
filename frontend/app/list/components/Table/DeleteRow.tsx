import React from 'react';
import { MdDelete } from "react-icons/md";

// Định nghĩa kiểu cho props
interface DeleteRowProps {
  deleteFunction: () => void;
}

const DeleteRow: React.FC<DeleteRowProps> = ({ deleteFunction }) => {
  return (
    <div onClick={deleteFunction} className="hover:cursor-pointer">
      <MdDelete />
    </div>
  );
}

export default DeleteRow;

import React from 'react';
import { MdEdit } from 'react-icons/md';

// Định nghĩa kiểu cho props
interface EditRowProps {
  editFunction: () => void; // Hàm này không có tham số và không trả về gì
}

const EditRow: React.FC<EditRowProps> = ({ editFunction }) => {
  return (
    <div onClick={editFunction} className='hover:cursor-pointer'>
      <MdEdit />
    </div>
  );
};

export default EditRow;

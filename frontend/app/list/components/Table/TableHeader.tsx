import React from 'react';

// Define the type for the props
interface TableHeaderProps {
  columnHeaders: string[];
}

const TableHeader: React.FC<TableHeaderProps> = ({ columnHeaders }) => {
  // Map through columnHeaders to create table header cells
  const TableHeaderData = columnHeaders.map((header, index) => (
    <td className='px-3 py-1 text-left font-bold max-w-[300px] border' key={index}>
      {header}
    </td>
  ));

  return (
    <thead className='bg-stone-200'>
      <tr>
        {TableHeaderData}
      </tr>
    </thead>
  );
}

export default TableHeader;
// import React from 'react';
// import TableHeader from './TableHeader';
// import TableRow from './TableRow';

// // Định nghĩa kiểu cho các props của Table
// interface TableProps<T extends object> { // Using `T extends object` to ensure T is an object
//   columnHeaders: string[];
//   rowsData: T[];
//   canEdit: boolean;
//   canDelete: boolean;
//   editFunction: (param: T) => void;
//   deleteFunction: (param: T) => void;
//   editFunctionParam: T;
//   deleteFunctionParam: T;
// }

// const Table = <T extends object>({
//   columnHeaders,
//   rowsData,
//   canEdit,
//   canDelete,
//   editFunction,
//   deleteFunction,
//   editFunctionParam,
//   deleteFunctionParam,
// }: TableProps<T>) => {
//   return (
//     <div className="relative w-fit h-fit overflow-scroll flex flex-col rounded-xl bg-clip-border border-stone-200">
//       <table className="border-collapse">
//         <TableHeader columnHeaders={columnHeaders} />
//         <TableRow
//           rowsData={rowsData}
//           canEdit={canEdit}
//           canDelete={canDelete}
//           editFunction={editFunction}
//           deleteFunction={deleteFunction}
//           editFunctionParam={editFunctionParam}
//           deleteFunctionParam={deleteFunctionParam}
//         />
//       </table>
//     </div>
//   );
// }

// export default Table;

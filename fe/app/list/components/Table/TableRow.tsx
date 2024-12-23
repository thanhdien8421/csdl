// import React from 'react';
// import EditRow from './EditRow';
// import DeleteRow from './DeleteRow';

// // Define the types for the props
// interface TableRowProps<T extends { id: string | number }> {
//   rowsData: T[];
//   canEdit: boolean;
//   canDelete: boolean;
//   editFunction: (param: T) => void;
//   deleteFunction: (param: T) => void;
//   editFunctionParam: T[];
//   deleteFunctionParam: T[];
// }

// const TableRow = <T extends object>(props: TableRowProps<T>) => {
//   const { editFunctionParam, deleteFunctionParam, rowsData, canEdit, canDelete, editFunction, deleteFunction } = props;

//   const tableRows: JSX.Element[] = [];

//   rowsData.forEach((rowData, index) => {
//     const row = Object.values(rowData).map((data, i) => (
//       <td className='max-w-[400px] text-wrap px-3 py-1 border' key={i}>
//         {data}
//       </td>
//     ));

//     if (canEdit && canDelete) {
//       row.push(
//         <td className='max-w-[400px] text-wrap px-3 py-1 border' key={rowData.id}>
//           <div className='flex flex-row gap-2 justify-around'>
//             <EditRow editFunction={() => editFunction(editFunctionParam[index])} />
//             <DeleteRow deleteFunction={() => deleteFunction(deleteFunctionParam[index])} />
//           </div>
//         </td>
//       );
//     } else if (canEdit && !canDelete) {
//       row.push(
//         <td className='max-w-[400px] text-wrap px-3 py-1 border' key={rowData.length}>
//           <div className='flex flex-row gap-2 justify-around'>
//             <EditRow editFunction={() => editFunction(editFunctionParam[index])} />
//           </div>
//         </td>
//       );
//     } else if (!canEdit && canDelete) {
//       row.push(
//         <td className='max-w-[400px] text-wrap px-3 py-1 border' key={rowData.length}>
//           <div className='flex flex-row gap-2 justify-around'>
//             <DeleteRow deleteFunction={() => deleteFunction(deleteFunctionParam[index])} />
//           </div>
//         </td>
//       );
//     }

//     tableRows.push(<tr key={index}>{row}</tr>);
//   });

//   return <tbody>{tableRows}</tbody>;
// };

// export default TableRow;
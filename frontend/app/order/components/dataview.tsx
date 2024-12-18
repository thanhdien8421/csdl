// "use client";

// import React, { useState, useEffect, useMemo } from "react";
// import { Button } from "primereact/button";
// import { Tag } from "primereact/tag";
// import axios from "axios";
// import pizzaImage from "../../../public/pizza1.png";
// import Image from "next/image";
// import DataCard from "./card";
// import { useForm } from "react-hook-form";
// import { Input } from "@/components/ui/input";
// import {
//   Dialog,
//   DialogContent,
//   DialogHeader,
//   DialogTitle,
// } from "@/components/ui/dialog";

// interface Product {
//   product_id: number;
//   product_name: string;
//   product_type: string;
//   product_price: number;
//   available_quantity: number;
//   quantity?: number; // Optional quantity field
// }interface FormData {
//   products: Record<string, Product>;
// }

// export default function BasicDemo() {
//   const storeId = 1;
//   const [products, setProducts] = useState<Product[]>([]);
//   const [initialProducts, setInitialProducts] = useState<Product[]>([]);
//   const [loading, setLoading] = useState<boolean>(true);
//   const [dialogOpen, setDialogOpen] = useState(false);
//   const [dialogData, setDialogData] = useState<Product[]>([]);
//   const [paymentMethod, setPaymentMethod] = useState<string>(""); // Payment method state
//   const [totalPrice, setTotalPrice] = useState<number>(0); // Total price of selected products

//   const { register, handleSubmit, watch, reset } = useForm();

//   useEffect(() => {
//     const fetchData = async () => {
//       setLoading(true);
//       try {
//         const response = await axios.get(`http://localhost:8000/api/product?id=${storeId}`);
//         if (response.data.statusCode === 200) {
//           const data: Product[] = response.data.data;
//           setProducts(data);
//           setInitialProducts(data); // Save the initial product state
//         } else {
//           console.error("Error fetching product data");
//         }
//       } catch (error) {
//         console.error("Error fetching product data:", error);
//       } finally {
//         setLoading(false);
//       }
//     };

//     fetchData();
//   }, []);

//   const watchedQuantities = watch(); // Watches all inputs

//   const getSeverity = (product: Product) => {
//     // Use the quantity from form, default to 0 if undefined
//     const quantity = watchedQuantities?.products?.[product.product_id]?.quantity ?? 0;
//     const remainingQuantity = product.available_quantity - quantity;
//     if (remainingQuantity > 10) return "success";
//     if (remainingQuantity > 0 && remainingQuantity <= 10) return "warning";
//     return "danger";
//   };

//   const gridItem = (product: Product) => {
//     // Get the quantity from the form or default to 0
//     const quantity = watchedQuantities?.products?.[product.product_id]?.quantity ?? 0;
//     const remainingQuantity = Math.max(0, product.available_quantity - quantity);

//     return (
//       <div
//         className="col-12 sm:col-6 lg:col-12 xl:col-4 p-2 border border-gray-200 border-l-0 border-t-0"
//         key={product.product_id}
//       >
//         <div className="p-4 border-1 surface-border surface-card border-round">
//           <div className="flex flex-column justify-between align-items-center gap-3 py-5">
//             <div className="flex flex-row gap-2 w-9/12">
//               <Image
//                 className="w-9 h-9 shadow-2 border-round"
//                 src={pizzaImage}
//                 alt={product.product_name}
//               />
//               <div className="text-2xl font-bold">{product.product_name}</div>
//             </div>
//             <Input
//               {...register(`products.${product.product_id}.name`)}
//               value={product.product_name}
//               className="hidden"
//             />
//             <Input
//               {...register(`products.${product.product_id}.quantity`, {
//                 valueAsNumber: true,
//               })}
//               type="number"
//               min={0}
//               max={product.available_quantity}
//               defaultValue={0} // Default to 0 if undefined
//               className="w-16"
//             />
//           </div>
//           <div className="flex flex-row align-items-center justify-between">
//             <span className="text-2xl font-semibold">${product.product_price}</span>
//             <Button
//               icon="pi pi-shopping-cart"
//               className="p-button-rounded"
//               disabled={remainingQuantity <= 0}
//             ></Button>
//             <div className="flex flex-row align-items-center gap-2">
//               <p className="pt-[3px]">Số lượng: </p>
//               <Tag value={remainingQuantity} severity={getSeverity(product)}></Tag>
//             </div>
//           </div>
//         </div>
//       </div>
//     );
//   };

//   const PizzaList = useMemo(() => {
//     return products.filter((item) => item.product_type === "Pizza").map(gridItem);
//   }, [products, watchedQuantities]);

//   const OtherFoodList = useMemo(() => {
//     return products.filter((item) => item.product_type === "Đồ ăn đi kèm").map(gridItem);
//   }, [products, watchedQuantities]);

//   const BeverageList = useMemo(() => {
//     return products.filter((item) => item.product_type === "Đồ uống").map(gridItem);
//   }, [products, watchedQuantities]);

//   const OtherList = useMemo(() => {
//     return products.filter((item) => item.product_type === "Khác").map(gridItem);
//   }, [products, watchedQuantities]);

//   const onSubmit = (data: FormData) => {
//     const filteredProducts = Object.entries(data.products || {})
//       .map(([id, product]: [string, Product]) => ({
//         product_id: id,
//         ...product,
//       }))
//       .filter((product) => product.quantity > 0);

//     setDialogData(filteredProducts);
//     setTotalPrice(
//       filteredProducts.reduce(
//         (sum, product) => sum + (product.quantity ?? 0) * product.product_price, // Default quantity to 0 if undefined
//         0
//       )
//     );
//     setDialogOpen(true);
//   };

//   const resetForm = () => {
//     reset(); // Reset the form
//     setProducts(initialProducts); // Restore the initial product state
//   };

//   const handlePostOrder = async () => {
//     try {
//       const response = await axios.post("http://localhost:8000/api/submitOrder", {
//         products: dialogData,
//         paymentMethod,
//       });

//       if (response.status === 200) {
//         console.log("Order submitted successfully");
//         setDialogOpen(false);
//         resetForm();
//       } else {
//         console.error("Failed to submit order");
//       }
//     } catch (error) {
//       console.error("Error submitting order:", error);
//     }
//   };

//   return (
//     <form onSubmit={handleSubmit(onSubmit)}>
//       <div className="card bg-yellow-300 pl-96 pb-5">
//         <div className="text-[100px] font-serif text-red-800">Menu</div>
//         {loading ? (
//           <div className="loading-spinner">Loading...</div>
//         ) : (
//           <div className="flex flex-col gap-5">
//             <div className="grid grid-cols-2 grid-row-2 gap-5">
//               <DataCard title="Pizza" color="from-orange-500 to-orange-600">
//                 <div className="grid grid-nogutter shadow-sm h-full">
//                   {PizzaList.length !== 0 ? (
//                     PizzaList
//                   ) : (
//                     <div className="flex flex-col items-center justify-center h-full text-gray-500">
//                       <p>Hiện không có sản phẩm nào</p>
//                     </div>
//                   )}
//                 </div>
//               </DataCard>
//               <DataCard title="Các món ăn kèm" color="from-yellow-500 to-yellow-600">
//                 <div className="grid grid-nogutter">
//                   {OtherFoodList.length !== 0 ? (
//                     OtherFoodList
//                   ) : (
//                     <div className="flex flex-col items-center justify-center h-full text-gray-500">
//                       <p>Hiện không có sản phẩm nào</p>
//                     </div>
//                   )}
//                 </div>
//               </DataCard>
//               <DataCard title="Nước giải khát" color="from-green-500 to-green-600">
//                 <div className="grid grid-nogutter">
//                   {BeverageList.length !== 0 ? (
//                     BeverageList
//                   ) : (
//                     <div className="flex flex-col items-center justify-center h-full text-gray-500">
//                       <p>Hiện không có sản phẩm nào</p>
//                     </div>
//                   )}
//                 </div>
//               </DataCard>
//               <DataCard title="Sản phẩm khác" color="from-blue-500 to-blue-600">
//                 <div className="grid grid-nogutter shadow-sm h-full">
//                   {OtherList.length !== 0 ? (
//                     OtherList
//                   ) : (
//                     <div className="flex flex-col items-center justify-center h-full text-gray-500">
//                       <p>Hiện không có sản phẩm nào</p>
//                     </div>
//                   )}
//                 </div>
//               </DataCard>
//             </div>
//             <div className="flex flex-row justify-center gap-5 mr-14">
//               <Button
//                 type="submit"
//                 className="bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white px-8 py-3 rounded-xl transition duration-300 transform hover:scale-105 hover:shadow-lg flex items-center gap-2 font-medium"
//               >
//                 OK
//               </Button>
//               <Button
//                 type="button"
//                 onClick={resetForm}
//                 className="bg-gradient-to-r from-red-500 to-red-600 hover:from-read-600 hover:to-red-700 text-white px-8 py-3 rounded-xl transition duration-300 transform hover:scale-105 hover:shadow-lg flex items-center gap-2 font-medium"
//               >
//                 Hủy
//               </Button>
//             </div>
//           </div>
//         )}
//       </div>

//       {/* Dialog for order confirmation */}
//       <Dialog open={dialogOpen} onOpenChange={setDialogOpen}>
//         <DialogContent>
//           <DialogHeader>
//             <DialogTitle>Order Summary</DialogTitle>
//           </DialogHeader>
//           <div className="space-y-4">
//             <h3 className="font-semibold text-lg">Products:</h3>
//             {dialogData.length > 0 ? (
//               dialogData.map((product) => (
//                 <div key={product.product_id} className="flex justify-between">
//                   <span>
//                     {product.product_name} (x{product.quantity ?? 0}) {/* Default to 0 */}
//                   </span>
//                   <span>${(product.quantity ?? 0) * product.product_price}</span>
//                 </div>
//               ))
//             ) : (
//               <p>No products selected</p>
//             )}
//             <div>
//               <h3 className="font-semibold text-lg">Total Price:</h3>
//               <p>${totalPrice}</p>
//             </div>
//             <div>
//               <h3 className="font-semibold text-lg">Payment Method:</h3>
//               <Input
//                 placeholder="Enter payment method"
//                 value={paymentMethod}
//                 onChange={(e) => setPaymentMethod(e.target.value)}
//               />
//             </div>
//           </div>
//           <div className="flex justify-end gap-4 mt-6">
//             <Button onClick={handlePostOrder} className="bg-blue-600 text-white">
//               Submit Order
//             </Button>
//             <Button
//               onClick={() => {
//                 setDialogOpen(false);
//                 resetForm();
//               }}
//               className="bg-gray-400 text-white"
//             >
//               Cancel
//             </Button>
//           </div>
//         </DialogContent>
//       </Dialog>
//     </form>
//   );
// }

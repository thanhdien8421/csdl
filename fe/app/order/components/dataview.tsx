"use client";

import React, { useState, useEffect, useMemo } from "react";
import { Button } from "primereact/button";
import { Tag } from "primereact/tag";
import axios from "axios";
import pizzaImage from "../../../public/pizza1.png";
import Image from "next/image";
import DataCard from "./card";
import { useForm } from "react-hook-form";
import { Input } from "@/components/ui/input";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"
import toast, { Toaster } from "react-hot-toast";

interface Product {
  product_id: number;
  product_name: string;
  product_type: string;
  product_price: number;
  available_quantity: number;
  quantity?: number; // Optional quantity field
}

export default function BasicDemo() {
  const storeId = 2;
  const salerId = 24;
  const [products, setProducts] = useState<Product[]>([]);
  const [initialProducts, setInitialProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [dialogOpen, setDialogOpen] = useState(false);
  const [dialogData, setDialogData] = useState<Product[]>([]);
  const [paymentMethod, setPaymentMethod] = useState<string>(""); // Payment method state
  const [totalPrice, setTotalPrice] = useState<number>(0); // Total price of selected products

  function money(number : number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

  const { register, handleSubmit, watch, reset } = useForm();

  const fetchData = async () => {
    setLoading(true);
    try {
      const response = await axios.get(`http://localhost:8000/api/product?id=${storeId}`);
      if (response.data.statusCode === 200) {
        const data: Product[] = response.data.data;
        setProducts(data);
        setInitialProducts(data); // Save the initial product state
      } else {
        console.error("Error fetching product data");
      }
    } catch (error) {
      console.error("Error fetching product data:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  const watchedQuantities = watch(); // Watches all inputs

  const getSeverity = (product: Product) => {
    // Use the quantity from form, default to 0 if undefined
    const quantity = watchedQuantities?.products?.[product.product_id]?.quantity ?? 0;
    const remainingQuantity = product.available_quantity - quantity;
    if (remainingQuantity > 10) return "success";
    if (remainingQuantity > 5 && remainingQuantity <= 10) return "warning";
    return "danger";
  };

  const gridItem = (product: Product) => {
    const quantity = watchedQuantities?.products?.[product.product_id]?.quantity ?? 0;
    const remainingQuantity = Math.max(0, product.available_quantity - quantity);

    return (
      <div
        className="col-12 sm:col-6 lg:col-12 xl:col-4 p-2 border border-gray-200 border-l-0 border-t-0"
        key={product.product_id}
      >
        <div className="p-4 border-1 surface-border surface-card border-round">
          <div className="flex flex-column justify-between align-items-center gap-3 py-5">
            <div className="flex flex-row gap-2 w-9/12">
              <Image
                className="w-9 h-9 shadow-2 border-round"
                src={pizzaImage}
                alt={product.product_name}
              />
              <div className="text-2xl font-bold text-red-600">{product.product_name}</div>
            </div>
            <Input
              {...register(`products.${product.product_id}.product_name`)}
              value={product.product_name}
              className="hidden"
            />
            <Input
              {...register(`products.${product.product_id}.quantity`, {
                valueAsNumber: true,
              })}
              type="number"
              min={0}
              max={product.available_quantity}
              defaultValue={0}
              className="w-16"
            />
            <Input
              {...register(`products.${product.product_id}.product_price`)} // Add this input to capture the product price
              value={product.product_price}
              className="hidden"
            />
          </div>
          <div className="flex flex-row align-items-center justify-between">
            <span className="text-2xl font-semibold">{money(product.product_price)}đ</span>
            <Button
              icon="pi pi-shopping-cart"
              className="p-button-rounded"
              disabled={remainingQuantity <= 0}
            ></Button>
            <div className="flex flex-row align-items-center gap-2">
              <p className="pt-[3px]">Số lượng: </p>
              <Tag value={remainingQuantity} severity={getSeverity(product)}></Tag>
            </div>
          </div>
        </div>
      </div>
    );
  };

  const PizzaList = useMemo(() => {
    return products.filter((item) => item.product_type === "Pizza").map(gridItem);
  }, [products, watchedQuantities]);

  const OtherFoodList = useMemo(() => {
    return products.filter((item) => item.product_type === "Đồ ăn đi kèm").map(gridItem);
  }, [products, watchedQuantities]);

  const BeverageList = useMemo(() => {
    return products.filter((item) => item.product_type === "Đồ uống").map(gridItem);
  }, [products, watchedQuantities]);

  const OtherList = useMemo(() => {
    return products.filter((item) => item.product_type === "Khác").map(gridItem);
  }, [products, watchedQuantities]);

  const onSubmit = (data: any) => {
    const filteredProducts = Object.entries(data.products || {})
      .map(([id, product]: any) => ({
        product_id: id,
        ...product,
      }))
      .filter((product) => product.quantity > 0);

    setDialogData(filteredProducts);
    console.log('+++')
    console.log(filteredProducts);
    setTotalPrice(
      filteredProducts.reduce(
        (sum, product) => sum + product.quantity * product.product_price, // Default quantity to 0 if undefined
        0
      )
    );
    setDialogOpen(true);
  };

  const resetForm = () => {
    reset(); // Reset the form
    setProducts(initialProducts); // Restore the initial product state
  };

  const handlePostOrder = async () => {
    const Order = {
      salerId: salerId,
      storeId: storeId,
      paymentMethod: paymentMethod,
      productIds: dialogData.map((product) => product.product_id).join(",") + ",",
      quantities: dialogData.map((product) => product.quantity).join(",") + ",", 
    };
    console.log(Order);
    try {
      // Pass `Order` directly as the request body
      const response = await axios.post("http://localhost:8000/api/order", Order, {
        headers: {
          "Content-Type": "application/json",
        },
      });
      console.log(response);
      if (response.status === 201) {
        toast.success(`Tạo đơn hàng thành công, mã đơn hàng: ${response.data.data[0].NewOrderId}`);
        console.log("Order submitted successfully");
        setDialogOpen(false);
        resetForm();
        fetchData(); // Re-fetch the data  
      } else {
        toast.error(`Tạo đơn hàng không thành công, lỗi ${response.status}`);
        console.error("Failed to submit order");
      }
    } catch (error) {
      console.error("Error submitting order:", error);
    }
  };

  const isAllProductsZero = useMemo(() => {
    return Object.values(watchedQuantities?.products || {}).every(
      (product: any) => product?.quantity === 0
    );
  }, [watchedQuantities]);

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <Toaster />
      <div className="card bg-yellow-300 pl-28 pb-5">
        <div className="flex flex-row justify-between items-center">
        <div className="text-[50px] font-serif text-red-800">Menu
        </div>
        <div className="flex flex-row justify-center gap-5 h-1/2 mr-[120px]">
              <Button
                type="submit"
                className="bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white px-8 py-3 rounded-xl transition duration-300 transform hover:scale-105 hover:shadow-lg flex items-center gap-2 font-medium"
                disabled={isAllProductsZero} // Disable OK button if no product selected
              >
                OK
              </Button>
              <Button
                type="button"
                onClick={resetForm}
                className="bg-gradient-to-r from-red-500 to-red-600 hover:from-read-600 hover:to-red-700 text-white px-8 py-3 rounded-xl transition duration-300 transform hover:scale-105 hover:shadow-lg flex items-center gap-2 font-medium"
              >
                Hủy
              </Button>
        </div>
        </div>
        {loading ? (
          <div className="loading-spinner">Loading...</div>
        ) : (
          <div className="flex flex-col gap-5 pl-36">
            <div className="grid grid-cols-2 grid-row-2 gap-5">
              <DataCard title="Pizza" color="from-orange-500 to-orange-600">
                <div className="grid grid-nogutter shadow-sm h-full">
                  {PizzaList.length !== 0 ? (
                    PizzaList
                  ) : (
                    <div className="flex flex-col items-center justify-center h-full text-gray-500">
                      <p>Hiện không có sản phẩm nào</p>
                    </div>
                  )}
                </div>
              </DataCard>
              <DataCard title="Các món ăn kèm" color="from-yellow-500 to-yellow-600">
                <div className="grid grid-nogutter">
                  {OtherFoodList.length !== 0 ? (
                    OtherFoodList
                  ) : (
                    <div className="flex flex-col items-center justify-center h-full text-gray-500">
                      <p>Hiện không có sản phẩm nào</p>
                    </div>
                  )}
                </div>
              </DataCard>
              <DataCard title="Nước giải khát" color="from-green-500 to-green-600">
                <div className="grid grid-nogutter">
                  {BeverageList.length !== 0 ? (
                    BeverageList
                  ) : (
                    <div className="flex flex-col items-center justify-center h-full text-gray-500">
                      <p>Hiện không có sản phẩm nào</p>
                    </div>
                  )}
                </div>
              </DataCard>
              <DataCard title="Sản phẩm khác" color="from-blue-500 to-blue-600">
                <div className="grid grid-nogutter shadow-sm h-full">
                  {OtherList.length !== 0 ? (
                    OtherList
                  ) : (
                    <div className="flex flex-col items-center justify-center h-full text-gray-500">
                      <p>Hiện không có sản phẩm nào</p>
                    </div>
                  )}
                </div>
              </DataCard>
            </div>
          </div>
        )}
      </div>

      <Dialog open={dialogOpen} onOpenChange={setDialogOpen}>
        <DialogContent className="p-6 bg-white rounded-lg shadow-lg w-full max-w-lg" aria-describedby="">
          <DialogHeader>
            <DialogTitle className="text-2xl font-bold text-gray-800 border-b pb-2">
              Hóa đơn
            </DialogTitle>
          </DialogHeader>
          <div className="space-y-6 h-[500px]">
            <div>
              <h3 className="font-semibold text-lg text-gray-700">Danh sách sản phẩm</h3>
                <div className="divide-y divide-gray-200 max-h-[300px] overflow-auto">
                  {dialogData
                    .filter((item) => item.quantity !== 0)
                    .map((product) => (
                      <div
                        key={product.product_id}
                        className="flex justify-between py-2 items-center"
                      >
                        <span className="text-gray-600">
                          {product.product_name} (x{product.quantity ?? 0})
                        </span>
                        <span className="text-gray-800 font-medium">
                          {money((product.quantity ?? 0) * product.product_price)}đ
                        </span>
                      </div>
                    ))}
                </div>
            </div>

            <div>
              <h3 className="font-semibold text-lg text-gray-700">Thanh toán</h3>
              <p className="text-gray-800 text-xl font-medium">{money(totalPrice)}đ</p>
            </div>

            {/* Payment Method */}
            <div>
              <h3 className="font-semibold text-lg text-gray-700">Phương thức thanh toán</h3>
              <div className="border border-gray-50">
              <Select
                    defaultValue="Trả tiền mặt"
                    onValueChange={setPaymentMethod}
                  >
                      <SelectTrigger>
                        <SelectValue placeholder="Trả tiền mặt"/>
                      </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="Thẻ tín dụng">Thẻ tín dụng</SelectItem>
                      <SelectItem value="Ví điện tử">Ví điện tử</SelectItem>
                      <SelectItem value="Trả tiền mặt">Trả tiền mặt</SelectItem>
                    </SelectContent>
              </Select>
              </div>
            </div>
          </div>

          {/* Buttons */}
          <div className="flex justify-end gap-4 mt-6">
            <Button
              onClick={handlePostOrder}
              className="bg-gradient-to-t from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white px-6 py-3 rounded-lg transition duration-300 transform hover:scale-105"
            >
              Xác nhận
            </Button>
            <Button
              onClick={() => setDialogOpen(false)}
              className="bg-gradient-to-t from-red-500 to-red-600 text-white px-6 py-3 rounded-lg transition duration-300 transform hover:scale-105"
            >
              Hủy
            </Button>
          </div>
        </DialogContent>
      </Dialog>
    </form>
  );
}

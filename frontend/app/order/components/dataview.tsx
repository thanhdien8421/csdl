import React, { useState, useEffect, useMemo } from 'react';
import { Button } from 'primereact/button';
import { Tag } from 'primereact/tag';
import axios from 'axios';
import pizzaImage from '../../../public/pizza1.png';
import Image from 'next/image';

interface Product {
    product_id: number;
    product_name: string;
    product_price: number;
    available_quantity: number;
}

export default function BasicDemo() {
    const storeId = 1;
    const [products, setProducts] = useState<Product[]>([]);
    const [loading, setLoading] = useState<boolean>(true);  // Add loading state

    useEffect(() => {
        const fetchData = async () => {
            setLoading(true);  // Set loading to true when starting to fetch data
            try {
                const response = await axios.get(`http://localhost:8000/api/product?id=${storeId}`);
                if (response.data.statusCode === 200) {
                    const data: Product[] = response.data.data;
                    setProducts(data);
                } else {
                    console.error('Error fetching product data');
                }
            } catch (error) {
                console.error('Error fetching product data:', error);
            } finally {
                setLoading(false);  // Set loading to false once data is fetched
            }
        };

        fetchData();
    }, []);

    const getSeverity = (product: Product) => {
        if (product.available_quantity > 10) return 'success';
        if (product.available_quantity > 0 && product.available_quantity <= 10) return 'warning';
        return 'danger';
    };

    const gridItem = (product: Product) => {
        return (
            <div className="col-12 sm:col-6 lg:col-12 xl:col-4 p-2" key={product.product_id}>
                <div className="p-4 border-1 surface-border surface-card border-round">
                    <div className="flex flex-wrap align-items-center justify-content-between gap-2">
                        <div className="flex align-items-center gap-2">
                            <i className="pi pi-tag"></i>
                        </div>
                        <Tag value={product.available_quantity} severity={getSeverity(product)}></Tag>
                    </div>
                    <div className="flex flex-column align-items-center gap-3 py-5">
                        <Image className="w-9 shadow-2 border-round" src={pizzaImage} alt={product.product_name} />
                        <div className="text-2xl font-bold">{product.product_name}</div>
                    </div>
                    <div className="flex align-items-center justify-content-between">
                        <span className="text-2xl font-semibold">${product.product_price}</span>
                        <Button icon="pi pi-shopping-cart" className="p-button-rounded" disabled={product.available_quantity <= 0}></Button>
                    </div>
                </div>
            </div>
        );
    };

    // Use useMemo to optimize rendering and avoid unnecessary rerenders
    const memoizedGridItems = useMemo(() => {
        return products.map(gridItem);
    }, [products]);

    return (
        <div className="card">
            <div>Menu</div>
            {loading ? (
                <div className="loading-spinner">Loading...</div> // Show loading spinner or text
            ) : (
                <div className="grid grid-nogutter">{memoizedGridItems}</div>
            )}
        </div>
    );
}

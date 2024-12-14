"use client"
import {Sidebar} from "./components/sidebar";

const OrderPage = () => {
    return (    
        <div className="flex flex-row-reverse w-full gap-x-4">    
            <Sidebar></Sidebar>
            <div className="w-[80%]">
            </div>
        </div>
    );
}

export default OrderPage
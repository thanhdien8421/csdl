"use client"
import {Sidebar} from "./components/sidebar";
import BasicDemo from "./components/dataview";
const OrderPage = () => {
    return (    
        <div className="flex flex-row-reverse w-full">    
            <Sidebar></Sidebar>
            <div className="w-full">
                <BasicDemo />
            </div>
        </div>
    );
}

export default OrderPage
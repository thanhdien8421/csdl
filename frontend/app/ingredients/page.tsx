"use client"
import {Sidebar} from "./components/Table/sidebar";
import Materials from "./components/Table/tabletest";
const ingredientsPage = () => {
    return (
        <div className="flex flex-row-reverse w-full gap-x-4">
            <Sidebar></Sidebar>
            <div className="w-[80%]">
                <Materials />
            </div>
        </div>
    );
}
export default ingredientsPage;
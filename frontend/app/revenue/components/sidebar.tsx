// "use client";
// import { useState } from "react";
// import { FiHome, FiInfo, FiSettings, FiPhone, FiChevronDown, FiChevronUp, FiMenu, FiX } from "react-icons/fi";
// import { FaProjectDiagram } from "react-icons/fa";
// import { MdMiscellaneousServices } from "react-icons/md";

// interface MenuItem {
//   id: string;
//   title: string;
//   icon: JSX.Element;
//   subItems: string[];
// }

// export const Sidebar = () => {
//   const [isOpen, setIsOpen] = useState<boolean>(true);
//   const [activeLink, setActiveLink] = useState<string>("home");
//   const [expandedMenus, setExpandedMenus] = useState<string[]>([]);

//   const menuItems: MenuItem[] = [
//     {
//       id: "home",
//       title: "Home",
//       icon: <FiHome className="w-5 h-5" />,
//       subItems: ["Dashboard", "Analytics", "Reports"]
//     },
//     {
//       id: "about",
//       title: "About",
//       icon: <FiInfo className="w-5 h-5" />,
//       subItems: ["Company", "Team", "History"]
//     },
//     {
//       id: "services",
//       title: "Services",
//       icon: <MdMiscellaneousServices className="w-5 h-5" />,
//       subItems: ["Consulting", "Development", "Support"]
//     },
//     {
//       id: "projects",
//       title: "Projects",
//       icon: <FaProjectDiagram className="w-5 h-5" />,
//       subItems: ["Current", "Completed", "Upcoming"]
//     },
//     {
//       id: "contact",
//       title: "Contact",
//       icon: <FiPhone className="w-5 h-5" />,
//       subItems: ["Email", "Phone", "Location"]
//     },
//     {
//       id: "settings",
//       title: "Settings",
//       icon: <FiSettings className="w-5 h-5" />,
//       subItems: ["Profile", "Preferences", "Security"]
//     }
//   ];

//   const toggleSidebar = () => setIsOpen(!isOpen);

//   const toggleSubmenu = (id: string) => {
//     setExpandedMenus((prev) =>
//       prev.includes(id) ? prev.filter((item) => item !== id) : [...prev, id]
//     );
//   };

//   const handleLinkClick = (id: string) => {
//     setActiveLink(id);
//   };

//   return (
//     <div className="fixed">
//       <button
//         onClick={toggleSidebar}
//         className=" fixed top-4 left-4 p-2 rounded-md bg-gray-800 text-white z-30"
//         aria-label={isOpen ? "Close sidebar" : "Open sidebar"}
//       >
//         {isOpen ? <FiX className="w-6 h-6" /> : <FiMenu className="w-6 h-6" />}
//       </button>

//       <aside
//         className={`fixed top-0 left-0 h-screen bg-white dark:bg-gray-800 shadow-xl transition-all duration-300 ease-in-out
//           ${isOpen ? "w-64" : "w-0 lg:w-20"} overflow-hidden`}
//         aria-label="Sidebar navigation"
//       >
//         <div className="h-full px-4 py-20 overflow-y-auto">

//           <nav>
//             <ul className="space-y-1">
//               {menuItems.map((item) => (
//                 <li key={item.id}>
//                   <button
//                     onClick={() => {
//                       handleLinkClick(item.id);
//                       toggleSubmenu(item.id);
//                     }}
//                     className={`w-full flex items-center justify-between px-4 py-3 rounded-lg transition-colors duration-200
//                       ${activeLink === item.id
//                         ? "bg-blue-500 text-white"
//                         : "text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700"
//                       }`}
//                     aria-expanded={expandedMenus.includes(item.id)}
//                     aria-controls={`${item.id}-submenu`}
//                   >
//                     <div className="flex items-center">
//                       <span className="mr-3">{item.icon}</span>
//                       <span className={`${!isOpen && "lg:hidden"}`}>{item.title}</span>
//                     </div>
//                     {isOpen && (
//                       <span className="transform transition-transform duration-200">
//                         {expandedMenus.includes(item.id) ? (
//                           <FiChevronUp className="w-5 h-5" />
//                         ) : (
//                           <FiChevronDown className="w-5 h-5" />
//                         )}
//                       </span>
//                     )}
//                   </button>

//                   {isOpen && expandedMenus.includes(item.id) && (
//                     <ul
//                       id={`${item.id}-submenu`}
//                       className="mt-1 ml-6 space-y-1 transition-all duration-200 ease-in-out"
//                       role="menu"
//                     >
//                       {item.subItems.map((subItem) => (
//                         <li key={subItem}>
//                           <button
//                             className="w-full text-left px-4 py-2 rounded-md text-gray-600 dark:text-gray-300
//                               hover:bg-gray-100 dark:hover:bg-gray-700 transition-colors duration-200"
//                             role="menuitem"
//                           >
//                             {subItem}
//                           </button>
//                         </li>
//                       ))}
//                     </ul>
//                   )}
//                 </li>
//               ))}
//             </ul>
//           </nav>
//         </div>
//       </aside>
//     </div>
//   );
// };
"use client"
import { useState } from "react";
import { FiHome, FiSettings, FiMenu, FiX } from "react-icons/fi";
import { MdMiscellaneousServices } from "react-icons/md";
import { useRouter } from 'next/navigation'; // Dùng next/router để điều hướng
import { useAuth } from "@/hooks/useAuth";

interface MenuItem {
  id: string;
  title: string;
  icon: JSX.Element;
  path: string; // Thêm đường dẫn path cho mỗi menu item
}

export const Sidebar = () => {
  const { logout } = useAuth();
  const [isOpen, setIsOpen] = useState<boolean>(true);
  const [activeLink, setActiveLink] = useState<string>("home");
  // const [expandedMenus, setExpandedMenus] = useState<string[]>([]);
  const router = useRouter(); // Dùng useRouter để điều hướng

  const menuItems: MenuItem[] = [
    {
      id: "ingredients",
      title: "Nguyên liệu",
      icon: <FiHome className="w-5 h-5" />,
      path: "/ingredients",  // Đường dẫn tương ứng
    },
    {
      id: "employees",
      title: "Nhân viên",
      icon: <FiSettings className="w-5 h-5" />,
      path: "/employees",
    },
    {
      id: "equipment",
      title: "Thiết bị",
      icon: <MdMiscellaneousServices className="w-5 h-5" />,
      path: "/equipment",
    },
    {
      id: "revenue",
      title: "Doanh thu",
      icon: <FiSettings className="w-5 h-5" />,
      path: "/revenue",
    }
  ];

  const toggleSidebar = () => setIsOpen(!isOpen);

  // const toggleSubmenu = (id: string) => {
  //   setExpandedMenus((prev) =>
  //     prev.includes(id) ? prev.filter((item) => item !== id) : [...prev, id]
  //   );
  // };
  const handleLogout = async () => {
    try {
      await logout(); // Gọi hàm logout từ useAuth
      router.push("/login"); // Điều hướng về trang đăng nhập sau khi logout
    } catch (error) {
      console.error("Logout failed", error);
    }
  };
  
  const handleLinkClick = (path: string) => {
    setActiveLink(path); // Cập nhật active link
    router.push(path); // Chuyển hướng đến đường dẫn tương ứng
  };

  return (
    <div className="fixed">
      <button
        onClick={toggleSidebar}
        className=" fixed top-4 left-4 p-2 rounded-md bg-gray-800 text-white z-30"
        aria-label={isOpen ? "Close sidebar" : "Open sidebar"}
      >
        {isOpen ? <FiX className="w-6 h-6" /> : <FiMenu className="w-6 h-6" />}
      </button>

      <aside
        className={`fixed top-0 left-0 h-screen bg-white dark:bg-gray-800 shadow-xl transition-all duration-300 ease-in-out
          ${isOpen ? "w-64" : "w-0 lg:w-20"} overflow-hidden`}
        aria-label="Sidebar navigation"
      >
        <div className="h-full px-4 py-20 overflow-y-auto">
          <nav>
            <ul className="space-y-1">
              {menuItems.map((item) => (
                <li key={item.id}>
                  <button
                    onClick={() => handleLinkClick(item.path)}
                    className={`w-full flex items-center justify-between px-4 py-3 rounded-lg transition-colors duration-200
                      ${activeLink === item.path
                        ? "bg-blue-500 text-white"
                        : "text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700"
                      }`}
                  >
                    <div className="flex items-center">
                      <span className="mr-3">{item.icon}</span>
                      <span className={`${!isOpen && "lg:hidden"}`}>{item.title}</span>
                    </div>
                  </button>
                </li>
              ))}
              <li>
                <button
                  onClick={handleLogout}
                  className="w-full flex items-center justify-between px-4 py-3 rounded-lg transition-colors duration-200 text-red-600 hover:bg-gray-100 dark:hover:bg-gray-700"
                >
                  <div className="flex items-center">
                    <span className="mr-3">Logout</span>
                  </div>
                </button>
              </li>
            </ul>
          </nav>
        </div>
      </aside>
    </div>
  );
};


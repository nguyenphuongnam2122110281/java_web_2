import React, { useState, useEffect } from "react";
import { Link, Outlet, useNavigate } from "react-router-dom";
import logo from "../../images/logo.png";
import { FaSearch } from "react-icons/fa";
import { IoMdLogOut } from "react-icons/io";
import { BsCart2 } from "react-icons/bs";
import { LuUser2 } from "react-icons/lu";
import CategoryService from "../../services/CategoryService";
import BrandService from "../../services/BrandService";
import AuthService from "../../services/AuthService";
import ProductService from "../../services/ProductService";

const LayoutFrontend = () => {
  const [category, setCategory] = useState([]);
  const [brand, setBrand] = useState([]);
  const [user, setUser] = useState(null);
  const [cartCount, setCartCount] = useState(0);
  const [keyword, setKeyword] = useState("");
  const [suggestions, setSuggestions] = useState([]);

  const navigate = useNavigate();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const categoryRes = await CategoryService.index();
        setCategory(categoryRes);

        const brandRes = await BrandService.index();
        setBrand(brandRes);

        const storedUser = JSON.parse(localStorage.getItem("user"));
        if (storedUser) setUser(storedUser);

        const cart = JSON.parse(localStorage.getItem("cart")) || [];
        setCartCount(cart.reduce((total, item) => total + item.quantity, 0));
      } catch (error) {
        console.error("Lỗi khi load layout:", error);
      }
    };

    fetchData();
  }, []);

  useEffect(() => {
    const delayDebounce = setTimeout(() => {
      const fetchSuggestions = async () => {
        try {
          if (keyword.trim() !== "") {
            const result = await ProductService.search(keyword);
            setSuggestions(result);
          } else {
            setSuggestions([]);
          }
        } catch (error) {
          console.error("Lỗi khi tìm kiếm sản phẩm:", error);
          setSuggestions([]);
        }
      };
      fetchSuggestions();
    }, 300);

    return () => clearTimeout(delayDebounce);
  }, [keyword]);

  const handleLogout = () => {
    AuthService.logout();
    setUser(null);
    navigate("/", { replace: true });
  };

  const updateCartCount = (newCount) => {
    setCartCount(newCount);
  };

  const handleSearch = (e) => {
    e.preventDefault();
    if (keyword.trim()) {
      navigate(`/product/search/${keyword.trim()}`);
    }
  };

  return (
    <div>
      {/* Header */}
      <section className="header">
        <div className="bg-white shadow-sm border-b border-gray-200">
          <div className="container max-w-7xl mx-auto grid grid-cols-12 items-center py-4">
            <div className="col-span-2">
              <Link to="/">
                <img src={logo} alt="Logo" className="w-40 object-contain" />
              </Link>
            </div>

            {/* Search */}
            <form
              onSubmit={handleSearch}
              className="col-span-4 flex items-center relative"
            >
              <input
                type="text"
                value={keyword}
                onChange={(e) => setKeyword(e.target.value)}
                placeholder="Tìm kiếm sản phẩm..."
                className="w-full border border-gray-300 rounded-full py-2 pl-5 focus:ring-2 focus:ring-green-400 focus:outline-none transition-all"
              />
              <button
                type="submit"
                className="absolute right-5 text-gray-500 hover:text-green-600"
              >
                <FaSearch className="text-lg" />
              </button>
              {suggestions.length > 0 && (
                <ul className="absolute top-full left-0 z-50 bg-white border w-full shadow rounded mt-2 max-h-60 overflow-y-auto">
                  {suggestions.map((item) => (
                    <li
                      key={item.id}
                      className="p-2 hover:bg-gray-100 cursor-pointer flex items-center gap-3"
                      onClick={() => navigate(`/productDetail/${item.id}`)}
                    >
                      <img
                        src={`http://localhost:8080/uploads/product/${item.thumbnail}`}
                        alt={item.name}
                        className="w-10 h-10 object-cover rounded"
                      />
                      <span>{item.name}</span>
                    </li>
                  ))}
                </ul>
              )}
            </form>

            {/* User & Cart */}
            <div className="col-span-6 flex items-center justify-end gap-10">
              <div className="grid grid-cols-12">
                {user ? (
                  <div className="flex items-center col-span-6 space-x-2">
                    <img
                      src={`http://localhost:8080/uploads/user/${user.avatar || "default.png"}`}
                      alt="Avatar"
                      className="w-10 h-10 rounded-full border-2 border-green-500 object-cover"
                    />
                    <span className="font-semibold text-green-700">{user.fullName}</span>
                    <button
                      onClick={handleLogout}
                      className="text-sm text-red-600 font-bold hover:underline flex items-center pl-8"
                    >
                      Đăng xuất
                    </button>
                  </div>
                ) : (
                  <div className="col-span-3">
                    <Link
                      to="/Login"
                      className="flex flex-col items-center text-green-700 hover:text-green-900"
                    >
                      <LuUser2 className="text-2xl" />
                      <p className="text-sm font-semibold">Đăng nhập</p>
                    </Link>
                  </div>
                )}

                <div className="col-span-6">
                  <Link
                    to="/cart"
                    className="flex flex-col items-center text-green-700 hover:text-green-900"
                  >
                    <div className="relative flex flex-col items-center">
                      <BsCart2 className="text-3xl" />
                      <span className="absolute -top-1 -right-2 bg-red-500 text-white text-xs px-2 py-0.5 rounded-full shadow">
                        {cartCount}
                      </span>
                      <p className="text-sm font-semibold">Giỏ hàng</p>
                    </div>
                  </Link>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Menu */}
        <section className="menu bg-category flex items-center">
          <div className="container max-w-7xl mx-auto flex items-center justify-center">
            <ul className="flex items-center text-white font-bold text-base space-x-10 justify-center">
              <li><Link to="/">Trang chủ</Link></li>
              <li className="relative group">
                <Link to="/product/all">Sản phẩm</Link>
              </li>
              <li className="relative group py-2">
                <Link to="#">Danh mục</Link>
                <ul className="absolute -left-2 hidden w-48 bg-white shadow-lg border border-gray-200 rounded-md group-hover:block z-50 mt-2">
                  {category.map((c) => (
                    <li key={c.id}>
                      <Link to={`/category/${c.id}`} className="block px-4 py-2 text-black hover:bg-[#fe5000] hover:text-white">{c.name}</Link>
                    </li>
                  ))}
                </ul>
              </li>
              <li className="relative group py-2">
                <Link to="#">Thương hiệu</Link>
                <ul className="absolute -left-2 hidden w-48 bg-white shadow-lg border border-gray-200 rounded-md group-hover:block z-50 mt-2">
                  {brand.map((b) => (
                    <li key={b.id}>
                      <Link to={`/brand/${b.id}`} className="block px-4 py-2 text-black hover:bg-[#fe5000] hover:text-white">{b.name}</Link>
                    </li>
                  ))}
                </ul>
              </li>
              <li><Link to="/Register">Đăng ký</Link></li>
            </ul>
          </div>
        </section>
      </section>

      <Outlet context={{ updateCartCount }} />

      {/* Footer */}
      <footer className="bg-footer text-white mt-10">
        <div className="container max-w-7xl mx-auto py-8 grid grid-cols-3 gap-6">
          <div>
            <h4 className="text-xl font-bold mb-4">Chính sách</h4>
            <ul className="space-y-2">
              <li><Link to="#">Chính sách bảo hành</Link></li>
              <li><Link to="#">Chính sách vận chuyển</Link></li>
              <li><Link to="#">Chính sách mua hàng</Link></li>
              <li><Link to="#">Chính sách đổi trả</Link></li>
            </ul>
          </div>
          <div>
            <h4 className="text-xl font-bold mb-4">Thương hiệu nổi bật</h4>
            <ul className="space-y-2">
              <li><Link to="#">Converse</Link></li>
              <li><Link to="#">Adidas</Link></li>
              <li><Link to="#">Nike</Link></li>
              <li><Link to="#">Puma</Link></li>
            </ul>
          </div>
          <div>
            <h4 className="text-xl font-bold mb-4">Kết nối với chúng tôi</h4>
            <div className="flex gap-4">
              <img src="/images/footer/facebook.png" className="w-12 h-12 rounded-full" />
              <img src="/images/footer/instagram.png" className="w-12 h-12 rounded-full" />
              <img src="/images/footer/zalo.png" className="w-12 h-12 rounded-full" />
            </div>
          </div>
        </div>
        <div className="border-t py-4 text-center">
          <p>Bản quyền © Nguyễn Vinh Sơn</p>
        </div>
      </footer>
    </div>
  );
};

export default LayoutFrontend;

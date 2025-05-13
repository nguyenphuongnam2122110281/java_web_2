import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import productService from "../../../services/ProductService";

const ProductSearchResult = () => {
  const { keyword } = useParams();
  const [products, setProducts] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProducts = async () => {
      if (!keyword) return;

      try {
        const res = await productService.search(keyword);
        setProducts(res);
        setError(null);
      } catch (err) {
        console.error("❌ Lỗi tìm kiếm sản phẩm:", err);
        setError("Đã xảy ra lỗi khi tìm kiếm sản phẩm.");
        setProducts([]);
      }
    };

    fetchProducts();
  }, [keyword]);

  return (
    <div className="p-5">
      <h2 className="text-2xl font-bold mb-4">
        Kết quả tìm kiếm:{" "}
        <span className="text-blue-600">{decodeURIComponent(keyword)}</span>
      </h2>

      {error && (
        <p className="text-red-500 font-semibold mb-4">{error}</p>
      )}

      {products.length === 0 && !error ? (
        <p>Không tìm thấy sản phẩm nào.</p>
      ) : (
        <div className="grid grid-cols-2 md:grid-cols-4 gap-5">
          {products.map((item) => (
            <div key={item.id} className="border p-3 rounded shadow">
              <img
                src={`http://localhost:8080/uploads/product/${item.thumbnail}`}
                className="w-full h-40 object-cover rounded"
                alt={item.name}
              />
              <h3 className="mt-2 font-bold">{item.name}</h3>
              <p className="text-red-500 font-semibold">
                {item.price?.toLocaleString()}₫
              </p>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default ProductSearchResult;

import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import ProductService from "../../../services/ProductService";


export default function SearchBox() {
  const [keyword, setKeyword] = useState("");
  const [suggestions, setSuggestions] = useState([]);
  const navigate = useNavigate();

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

  const handleSelect = (id) => {
    setKeyword("");
    setSuggestions([]);
    navigate(`/product/${id}`);
  };

  return (
    <div className="relative w-full max-w-md mx-auto">
      <input
        type="text"
        className="w-full border rounded px-3 py-2 shadow-sm focus:outline-none focus:ring focus:border-blue-400"
        placeholder="Tìm sản phẩm..."
        value={keyword}
        onChange={(e) => setKeyword(e.target.value)}
      />

      {suggestions.length > 0 && (
        <ul className="absolute z-10 bg-white border w-full shadow rounded mt-1 max-h-60 overflow-y-auto">
          {suggestions.map((item) => (
            <li
              key={item.id}
              className="p-2 hover:bg-gray-100 cursor-pointer flex items-center gap-3"
              onClick={() => handleSelect(item.id)}
            >
              <img
                src={`http://localhost:8080/uploads/product/${item.thumbnail}`}
                alt={item.name}
                className="w-12 h-12 object-cover rounded"
              />
              <span>{item.name}</span>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

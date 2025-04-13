import { useState, useEffect } from "react";

const Consumer = () => {
  const [messages, setMessages] = useState([]);

  useEffect(() => {
    const fetchMessages = async () => {
      const response = await fetch("http://localhost:3000/consumer/listen");
      const data = await response.json();
      setMessages(data.messages);
    };

    fetchMessages();
    const interval = setInterval(fetchMessages, 3000);
    return () => clearInterval(interval);
  }, []);

  return (
    <div>
      <h2>Consumer</h2>
      <ul>
        {messages.map((msg, index) => (
          <li key={index}>{msg}</li>
        ))}
      </ul>
    </div>
  );
};

export default Consumer;

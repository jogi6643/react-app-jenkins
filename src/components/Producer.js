import { useState } from "react";

const Producer = () => {
  const [message, setMessage] = useState("");

  const sendMessage = async () => {
    const response = await fetch("http://localhost:3000/producer/send", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ message }),
    });

    if (response.ok) {
      alert("Message sent!");
      setMessage("");
    } else {
      alert("Error sending message");
    }
  };

  return (
    <div>
      <h2>Producer</h2>
      <input
        type="text"
        placeholder="Enter message"
        value={message}
        onChange={(e) => setMessage(e.target.value)}
      />
      <button onClick={sendMessage}>Send</button>
    </div>
  );
};

export default Producer;

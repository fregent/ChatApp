import React, { useState, useEffect } from 'react';
import axios from 'axios';

const Chat = () => {
  const [messages, setMessages] = useState([]);

  useEffect(() => {
    // Fetch messages from your Rails API
    const fetchMessages = async () => {
      const response = await axios.get('http://localhost:3000/messages');
      setMessages(response.data);
    };

    fetchMessages();
  }, []);

  return (
    <div>
      <h2>Chat Messages</h2>
      {messages.map((message, index) => (
        <p key={index}>{message.content}</p>
      ))}
    </div>
  );
};

export default Chat;

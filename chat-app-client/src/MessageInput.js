import React, { useState } from 'react';
import axios from 'axios';

const MessageInput = () => {
  const [content, setContent] = useState('');

  const sendMessage = async () => {
    if (content) {
      await axios.post('http://localhost:3000/messages', { content });
      setContent('');
      // Optionally, refresh the message list or use WebSocket for real-time update
    }
  };

  return (
    <div>
      <textarea
        value={content}
        onChange={(e) => setContent(e.target.value)}
      />
      <button onClick={sendMessage}>Send</button>
    </div>
  );
};

export default MessageInput;


<!Doctype html>
<html>
<style>
.btn-group button {
    background-color:  #3366cc; /* Green background */
    border: none;
    color: white; /* White text */
    padding: 30px 30px; /* Some padding */
    font-size: 15px;
    cursor: pointer; /* Pointer/hand icon */
    width: 50%; /* Set a width if needed */
    display: block; /* Make the buttons appear below each other */
}

.btn-group button:not(:last-child) {
    border-bottom: none; /* Prevent double borders */
}

/* Add a background color on hover */
.btn-group button:hover {
    background-color: #000000;
}
</style>
<body>
  <div class="btn-group">
  <button >Home</button>
  <button>Police</button>
  <button>Municipality</button>
  <button>Electricity</button>
</div>
</body>
</html>

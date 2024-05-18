from flask import Flask, render_template, request
import sqlite3

app = Flask(__name__)

DATABASE = 'proj.db'

def create_tables():
    with sqlite3.connect(DATABASE) as conn:
        cursor = conn.cursor()
        cursor.execute('''CREATE TABLE IF NOT EXISTS Customer (
                            Cust_Id INTEGER PRIMARY KEY,
                            Name TEXT,
                            Email TEXT,
                            C_City TEXT,
                            C_State TEXT,
                            C_Pincode INTEGER
                          )''')
        cursor.execute('''CREATE TABLE IF NOT EXISTS Cart_has (
                            Cust_Id INTEGER,
                            Cart_Id INTEGER,
                            Cart_Quantity INTEGER,
                            PRIMARY KEY (Cust_Id, Cart_Id),
                            FOREIGN KEY (Cust_Id) REFERENCES Customer(Cust_Id)
                          )''')
        cursor.execute('''CREATE TABLE IF NOT EXISTS Product_belongsto (
                            Product_Id INTEGER PRIMARY KEY,
                            Cat_type TEXT,
                            Product_Name TEXT,
                            Price INTEGER
                          )''')
        cursor.execute('''CREATE TABLE IF NOT EXISTS Order_orders (
                            Order_Id INTEGER PRIMARY KEY,
                            Cust_Id INTEGER,
                            Order_Date TEXT,
                            FOREIGN KEY (Cust_Id) REFERENCES Customer(Cust_Id)
                          )''')
        cursor.execute('''CREATE TABLE IF NOT EXISTS Supplier (
                            Supplier_Id INTEGER PRIMARY KEY,
                            Supplier_Name TEXT,
                            S_Pincode INTEGER,
                            S_State TEXT,
                            S_City TEXT
                          )''')
        cursor.execute('''CREATE TABLE IF NOT EXISTS Warehouse (
                            Warehouse_Id INTEGER PRIMARY KEY,
                            War_Quantity INTEGER
                          )''')

create_tables()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/search_customer', methods=['GET', 'POST'])
def search_customer():
    if request.method == 'POST':
        cust_id = request.form['cust_id']
        with sqlite3.connect(DATABASE) as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Customer WHERE Cust_Id = ?", (cust_id,))
            customer = cursor.fetchone()
        return render_template('search_customer.html', customer=customer)
    return render_template('search_customer.html')

@app.route('/search_cart', methods=['GET', 'POST'])
def search_cart():
    if request.method == 'POST':
        cust_id = request.form['cust_id']
        cart_id = request.form['cart_id']
        with sqlite3.connect(DATABASE) as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Cart_has WHERE Cust_Id = ? AND Cart_Id = ?", (cust_id, cart_id))
            cart = cursor.fetchone()
        return render_template('search_cart.html', cart=cart)
    return render_template('search_cart.html')

@app.route('/search_product', methods=['GET', 'POST'])
def search_product():
    if request.method == 'POST':
        product_id = request.form['product_id']
        with sqlite3.connect(DATABASE) as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Product_belongsto WHERE Product_Id = ?", (product_id,))
            product = cursor.fetchone()
        return render_template('search_product.html', product=product)
    return render_template('search_product.html')

@app.route('/search_order', methods=['GET', 'POST'])
def search_order():
    if request.method == 'POST':
        order_id = request.form['order_id']
        with sqlite3.connect(DATABASE) as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Order_orders WHERE Order_Id = ?", (order_id,))
            order = cursor.fetchone()
        return render_template('search_ord.html', order=order)
    return render_template('search_ord.html')

@app.route('/search_supplier', methods=['GET', 'POST'])
def search_supplier():
    if request.method == 'POST':
        supplier_id = request.form['supplier_id']
        with sqlite3.connect(DATABASE) as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Supplier WHERE Supplier_Id = ?", (supplier_id,))
            supplier = cursor.fetchone()
        return render_template('search_supp.html', supplier=supplier)
    return render_template('search_supp.html')

@app.route('/search_warehouse', methods=['GET', 'POST'])
def search_warehouse():
    if request.method == 'POST':
        warehouse_id = request.form['warehouse_id']
        with sqlite3.connect(DATABASE) as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Warehouse WHERE Warehouse_Id = ?", (warehouse_id,))
            warehouse = cursor.fetchone()
        return render_template('search_ware.html', warehouse=warehouse)
    return render_template('search_ware.html')

if __name__ == '__main__':
    app.run(debug=True)

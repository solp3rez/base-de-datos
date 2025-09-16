from flask import Flask, jsonify
import mysql.connector


app = Flask(__name__)


# Configuración de la conexión a MySQL

config = {
    'user': 'proyecto',
    'password': 'proyecto1234',
    'host': '10.9.120.5',
    'port': 3306,              
    'database': 'ProyectoUBA' 
}



@app.route("/Ingles")
def get_Ingles():
   try:
       conn = mysql.connector.connect(**config)
       cursor = conn.cursor(dictionary=True)


       cursor.execute("SELECT * FROM Ingles")
       rows = cursor.fetchall()


       cursor.close()
       conn.close()


       return jsonify(rows)


   except Exception as e:
       return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
   app.run(host="0.0.0.0", port=5000, debug=True)

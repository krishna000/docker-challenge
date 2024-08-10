from flask import Flask, jsonify
import psutil

app = Flask(__name__)

@app.route('/metrics', methods=['GET'])
def metrics():
    cpu_percent = psutil.cpu_percent(interval=1)
    memory_info = psutil.virtual_memory()
    return jsonify({
        'cpu_percent': cpu_percent,
        'memory_total': memory_info.total,
        'memory_available': memory_info.available,
        'memory_used': memory_info.used
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)


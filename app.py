from flask import Flask, jsonify

# Create a Flask application instance
app = Flask(__name__)

# Mock data for the S3 bucket
bucket_data = {
    "": ["dir1/", "dir2/", "file1.txt", "file2.jpg"],  # Top-level contents
    "dir1": ["file1.txt", ],  # Contents of dir1 (empty directory)
    "dir2": [ "file2.jpg"]  # Contents of dir2
}

@app.route('/list-bucket-content', defaults={'subpath': ''}, methods=['GET'])
@app.route('/list-bucket-content/<path:subpath>', methods=['GET'])
def list_bucket_content(subpath):
    """
    List the contents of the S3 bucket or a specific subdirectory.
    """
    # Fetch content for the given subpath
    if subpath in bucket_data:
        response = {"content": bucket_data[subpath]}
    else:
        response = {"content": []}  # Default to empty if the subpath doesn't exist

    return jsonify(response)

# Entry point to run the application
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

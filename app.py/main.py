from fastapi import FastAPI
from pydantic import BaseModel
import joblib

app = FastAPI()

# Load the pre-trained model
model = joblib.load("breast_cancer_classify.pkl")


class CancerData(BaseModel):
    radius_mean: float
    texture_mean: float
    perimeter_mean: float
    area_mean: float


@app.get("/")
def root():
    return {"message": "Welcome to the Breast Cancer Classifier API"}


@app.post("/predict")
def predict_cancer(data: CancerData):
    # Extract features from request
    features = [[data.radius_mean, data.texture_mean, data.perimeter_mean, data.area_mean]]

    # Perform prediction
    prediction = model.predict(features)
    prediction_proba = model.predict_proba(features)
    return {
        "Prediction": "Malignant" if prediction[0] == 1 else "Benign",
        "Prediction Probability (Malignant)": prediction_proba[0][1],
        "Prediction Probability (Benign)": prediction_proba[0][0],
    }

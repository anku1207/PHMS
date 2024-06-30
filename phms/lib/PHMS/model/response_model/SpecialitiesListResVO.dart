/// success : "1"
/// message : "Specialities Found"
/// data : [{"SPECIALITY":"Andrologist"},{"SPECIALITY":"Bariatric Surgeon"},{"SPECIALITY":"Bone Marrow Transplant Specialist"},{"SPECIALITY":"Breast Surgeon"},{"SPECIALITY":"Cardiac Electrophysiologist"},{"SPECIALITY":"Cardiac Surgeon"},{"SPECIALITY":"Cardiologist"},{"SPECIALITY":"Critical Care Specialist"},{"SPECIALITY":"Dentist"},{"SPECIALITY":"Dermatologist"},{"SPECIALITY":"Diabetes Specialist"},{"SPECIALITY":"Dietitian"},{"SPECIALITY":"Emergency Doctor"},{"SPECIALITY":"Endocrinologist"},{"SPECIALITY":"ENT Specialist"},{"SPECIALITY":"Fetal Medicine Specialist"},{"SPECIALITY":"Gastric Oncologist"},{"SPECIALITY":"Gastroenterologist"},{"SPECIALITY":"General Surgeon"},{"SPECIALITY":"Genetic Medicine Specialist"},{"SPECIALITY":"Geriatric Medicine Specialist"},{"SPECIALITY":"Gynaecologist"},{"SPECIALITY":"Gynecologic Oncologist"},{"SPECIALITY":"Head & Neck Surgeon"},{"SPECIALITY":"Hemato Oncologist"},{"SPECIALITY":"Hematologist"},{"SPECIALITY":"Hepatologist"},{"SPECIALITY":"Immunologist"},{"SPECIALITY":"Infectious Disease Specialist"},{"SPECIALITY":"Internal Medicine Specialist"},{"SPECIALITY":"Interventional Radiologist"},{"SPECIALITY":"IVF Specialist"},{"SPECIALITY":"Joint Replacement Surgeon"},{"SPECIALITY":"Laparoscopic Surgeon"},{"SPECIALITY":"Liver Transplant Specialist"},{"SPECIALITY":"Neonatologist"},{"SPECIALITY":"Nephrologist"},{"SPECIALITY":"Neuro Radiologist"},{"SPECIALITY":"Neurologist"},{"SPECIALITY":"Neurosurgeon"},{"SPECIALITY":"Nuclear Medicine Specialist"},{"SPECIALITY":"Oncologist"},{"SPECIALITY":"Opthalmologist"},{"SPECIALITY":"Orthopedist"},{"SPECIALITY":"Paediatric Cardiologist"},{"SPECIALITY":"Paediatric Endocrinologist"},{"SPECIALITY":"Paediatric Gastroenterologist"},{"SPECIALITY":"Paediatric Nephrologist"},{"SPECIALITY":"Paediatric Neurologist"},{"SPECIALITY":"Paediatric Neurosurgeon"},{"SPECIALITY":"Paediatric Ophthalmologist"},{"SPECIALITY":"Paediatric Orthopedist"},{"SPECIALITY":"Paediatric Pulmonologist"},{"SPECIALITY":"Paediatric Surgeon"},{"SPECIALITY":"Paediatric Urologist"},{"SPECIALITY":"Pain Management Specialist"},{"SPECIALITY":"Pathologist"},{"SPECIALITY":"Pediatric Cardiac Surgeon"},{"SPECIALITY":"Pediatric Immunologist"},{"SPECIALITY":"Pediatric Oncologist"},{"SPECIALITY":"Pediatric Rheumatologist"},{"SPECIALITY":"Pediatrician"},{"SPECIALITY":"Physiatrist"},{"SPECIALITY":"Physiotherapist"},{"SPECIALITY":"Plastic Surgeon"},{"SPECIALITY":"Podiatrist"},{"SPECIALITY":"Psychiatrist"},{"SPECIALITY":"Psychologist"},{"SPECIALITY":"Pulmonologist"},{"SPECIALITY":"Radiation Oncologist"},{"SPECIALITY":"Radiologist"},{"SPECIALITY":"Renal Transplant Specialist"},{"SPECIALITY":"Rheumatologist"},{"SPECIALITY":"Robotic Surgeon"},{"SPECIALITY":"Spine Surgeon"},{"SPECIALITY":"Surgical Gastroenterologist"},{"SPECIALITY":"Surgical Oncologist"},{"SPECIALITY":"Transfusion Medicine Specialist"},{"SPECIALITY":"Uro Oncologist"},{"SPECIALITY":"Urologist"},{"SPECIALITY":"Vascular Surgeon"}]

class SpecialitiesListResVO {
  SpecialitiesListResVO({
      String? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SpecialitiesListResVO.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _success;
  String? _message;
  List<Data>? _data;

  String? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// SPECIALITY : "Andrologist"

class Data {
  Data({
      String? speciality,}){
    _speciality = speciality;
}

  Data.fromJson(dynamic json) {
    _speciality = json['SPECIALITY'];
  }
  String? _speciality;

  String? get speciality => _speciality;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SPECIALITY'] = _speciality;
    return map;
  }

}
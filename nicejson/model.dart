class UsersDetail {
  int id;
  String name;
  String code;
  String smsType;
  String contactPersonName;
  String contactNumber;
  Null designationName;
  String email;
  String emails;
  String contactPersons;
  String assignToEmployee;
  String createdOn;
  bool isIndividual;
  String zoneName;

  UsersDetail(
      {this.id,
      this.name,
      this.code,
      this.smsType,
      this.contactPersonName,
      this.contactNumber,
      this.designationName,
      this.email,
      this.emails,
      this.contactPersons,
      this.assignToEmployee,
      this.createdOn,
      this.isIndividual,
      this.zoneName,
      });

  // factory UsersDetail.fromJson(Map<String, dynamic> json) {
  //   return new UsersDetail(
       UsersDetail.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    code = json['Code'];
    smsType = json['smsType'];
    contactPersonName = json['ContactPersonName'];
    contactNumber = json['ContactNumber'];
    designationName = json['DesignationName'];
    email = json['Email'];
    emails = json['Emails'];
    contactPersons = json['ContactPersons'];
    assignToEmployee = json['AssignToEmployee'];
    createdOn = json['CreatedOn'];
    isIndividual = json['IsIndividual'];
    zoneName = json['ZoneName'];
        
        
  }
}

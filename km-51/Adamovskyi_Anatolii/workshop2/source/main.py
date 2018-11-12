from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

desease = {
    "DIS_NAME": "dis_name1",
    "DIS_DESC": "dis_desc1",
}

medicine_for_desease_or_symptom = {
    "MDS_DATE": "2018-11-04 10:37:54",
    "DESEASE_DIS_NAME": "dis_name1",
    "SYMPTOM_SYM_NAME": "sym_name3",
    "MEDICINE_MED_NAME": "med_name1"
}


@app.route('/api/<action>', methods=['GET'])
def api_get(action):
    if action == "desease":
        return render_template("desease.html", desease=desease)
    elif action == "medicine_for_desease_or_symptom":
        return render_template("medicine_for_desease_or_symptom.html", medicine_for_desease_or_symptom=medicine_for_desease_or_symptom)
    elif action == "all":
        return render_template("all.html", desease=desease, medicine_for_desease_or_symptom=medicine_for_desease_or_symptom, name=['desease', 'medicine_for_desease_or_symptom', 'all']
                               )
    else:
        return render_template("404.html", name=['desease', 'medicine_for_desease_or_symptom', 'all'], action_value=action)


@app.route('/api', methods=['POST'])
def api_post():

    if request.form["action"] == "desease_update":
        desease["DIS_NAME"] = request.form["DIS_NAME"]
        desease["DIS_DESC"] = request.form["DIS_DESC"]

        return redirect(url_for('api_get', action="all"))

    if request.form["action"] == "mds_update":
        medicine_for_desease_or_symptom["MDS_DATE"] = request.form["MDS_DATE"]
        medicine_for_desease_or_symptom["DESEASE_DIS_NAME"] = request.form["DESEASE_DIS_NAME"]
        medicine_for_desease_or_symptom["SYMPTOM_SYM_NAME"] = request.form["SYMPTOM_SYM_NAME"]
        medicine_for_desease_or_symptom["MEDICINE_MED_NAME"] = request.form["MEDICINE_MED_NAME"]
        return redirect(url_for('api_get', action='all'))


if __name__ == '__main__':
    app.run()

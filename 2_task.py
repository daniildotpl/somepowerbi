import pandas as pd
from ishch.connector import my_connection
from docxtpl import DocxTemplate



def get_payload(engine, reporting_year, reporting_region):

    query = f"""
        SELECT 
            year,
            region,
            SUM(doctors) doctors,
            SUM(nurse) nurse,
            COUNT(*) count_org,
            SUM(visits) visits
        FROM statinfo
        WHERE year IN ({str(reporting_year)}, {str(reporting_year-1)}) AND region={reporting_region}
        GROUP BY year
        ORDER BY year
        ;
    """
    payload = pd.read_sql(query, engine)
    payload.loc[len(payload)] = [
        'delta', 
        '-',
        round((payload.loc[1]['doctors'] - payload.loc[0]['doctors'])/payload.loc[1]['doctors'], 2), 
        round((payload.loc[1]['nurse'] - payload.loc[0]['doctors'])/payload.loc[1]['nurse'], 2), 
        round((payload.loc[1]['count_org'] - payload.loc[0]['count_org'])/payload.loc[1]['count_org'], 2), 
        round((payload.loc[1]['visits'] - payload.loc[0]['visits'])/payload.loc[1]['visits'], 2)
    ]
    print(payload)
    return payload


def get_context(payload):
    # count of more and less deltas ------------
    count_less = 0
    count_more = 0
    deltas = payload.loc[2].tolist()
    del deltas[0:2]
    for d in deltas:
        if d < 0:
            count_less += 1
        if d > 0:
            count_more += 1
    # print(f'count_less: {count_less}, count_more: {count_more}')
    # make context ------------------------------
    context = {}
    context['reporting_year'] = payload.loc[1]['year']
    context['prevent_year'] = int(payload.loc[1]['year']) - 1
    context['reporting_region'] = payload.loc[1]['region']
    # ---
    payload_as_dict = payload.set_index('year').to_dict('index')
    for year, dictt in payload_as_dict.items():
        for key, value in dictt.items():
            key = key + '_' + year
            # print(key)
            context[key] = value
    # ---
    context['count_less'] = str(count_less)
    context['count_more'] = str(count_more)
    context['kids'] = 1000
    context['adult'] = 2000
    # print(f'context: {context}')
    return context


def make_word(context):
    # make dokument -----------------------------
    doc = DocxTemplate("ishch/template.docx")
    doc.render(context)
    doc.save("generated_document.docx")


if __name__ == "__main__":
    payload = get_payload(my_connection(), 2025, 77)
    context = get_context(payload)
    make_word(context)














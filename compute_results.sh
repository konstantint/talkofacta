# Talk of ACTA analysis script

# Create directories
mkdir -p data/textdb
mkdir data/zodb

export CONFIG=sample_config.py

# ---------- Convert CSV into DB ----------
# We use SQLite in our experiments
time bin/csv2db

# ---------- Extract words from texts ----------
time bin/compute_features words

# ---------- Compute set of common words to use in feature extraction ----------
time bin/collect_words

# ---------- Extract country-specific words ----------
time bin/extract_significant_features words by_hansard

# real    3m49.683s
# user    38m27.360s
# sys     3m30.471s

# ---------- Extract month-specific words ----------
time bin/extract_significant_features words by_month

# real    4m6.577s
# user    118m20.409s
# sys     13m32.315s

# ---------- Extract year-specific words ----------
 time bin/extract_significant_features words by_year

# real    5m20.749s
# user    33m50.396s
# sys     3m36.261s


# If you used default config (sample_config.py), at this point the results are
# all written out to the file <root_dir>/data/resultsdb.sqlite
# This file is used by the talkofeuropeweb visualization webapp (it is bundled with it).
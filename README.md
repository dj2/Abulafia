# Abulafia

Simple note management application.

## Configuration
```
EDITOR=nvim
ABULAFIA_DIR=~/Notes
```

* `EDITOR` is used when creating and editing notes. Defaults to `vi`.
* `ABULAFIA_DIR` is the note storage directory. Defaults to `~/Notes`.

## Usage

### Help
```
./bin/abulafia help
```

### List notes
```
./bin/abulafia list
```

### New note
```
./bin/abulafia new "note name"
```

### Edit note
```
./bin/abulafia edit <note>
```

### Append to note
```
./bin/abulafia append <note> <content>
```

### Search notes
```
./bin/abulafia search <content>
```

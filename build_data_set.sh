#coding:utf-8
<<<<<<< HEAD
#workpath=$1
workpath=$HOME/work2017/Research_of_DA/dataSets/office-dataset/
=======
workpath=$1
>>>>>>> 22b64def45f9776969700b9cb23bb657a4a2106e
echo 'your dataset_path is  '$workpath
#'/home/gui/work2017/Research_of_transfer_Learning/dataSets/office-dataset/'
cate_arr=("back_pack"  "bike_helmet"  'bottle'  'desk_lamp'  'desktop_computer'  'file_cabinet'  'keyboard' 'laptop_computer'  'mobile_phone'  'mouse'  'printer'  'projector'  'ring_binder'  'ruler'  'speaker' 'trash_can')
path_source=${workpath}'amazon_source/'
<<<<<<< HEAD
path_source_train=${workpath}'amazon_source_train/'
path_source_test=${workpath}'amazon_source_test/'
=======
>>>>>>> 22b64def45f9776969700b9cb23bb657a4a2106e
path_target=${workpath}'webcam_target/'
path_target_train=${workpath}'webcam_target_train/'
path_target_test=${workpath}'webcam_target_test/'

### function create_dir() 
create_dir(){
    if test -d $1
    then
        echo $1'    exists'
    else
        mkdir $1
    fi
}


### function create_img_arr (frame_0001.jpg .......)
### 最好别用数组，尽量用while来代替,因为数组不方便作为函数的参数

<<<<<<< HEAD
### function cp_or_mv_img_from_to
cp_or_mv_img_from_to(){
    img_num=$3
    from=$4     #${workpath}amazon/images/ 
    to=$5       #${path_source}
=======
### function cp_img_from_to
cp_img_from_to(){
    img_num=$1
    from=$2     #${workpath}amazon/images/ 
    to=$3       #${path_source}
>>>>>>> 22b64def45f9776969700b9cb23bb657a4a2106e
    for cate in ${cate_arr[*]}
    do
        echo --------------
        create_dir ${to}${cate}
        int_k=1
        while ((int_k<=$img_num))
        do
            if ((int_k<10))
    	    then
<<<<<<< HEAD
                $1 $2 ${from}${cate}/frame_000${int_k}.jpg   ${to}${cate}/
            else
                $1 $2 ${from}${cate}/frame_00${int_k}.jpg   ${to}${cate}/
=======
                cp -r ${from}${cate}/frame_000${int_k}.jpg   ${to}${cate}/
            else
                cp -r ${from}${cate}/frame_00${int_k}.jpg   ${to}${cate}/
>>>>>>> 22b64def45f9776969700b9cb23bb657a4a2106e
            fi
            let int_k++
        done
    done
}

rm -r $path_source
<<<<<<< HEAD
rm -r $path_source_train
rm -r $path_source_test
=======
>>>>>>> 22b64def45f9776969700b9cb23bb657a4a2106e
rm -r $path_target
rm -r $path_target_train
rm -r $path_target_test


create_dir $path_source
<<<<<<< HEAD
create_dir $path_source_train
create_dir $path_source_test
=======
>>>>>>> 22b64def45f9776969700b9cb23bb657a4a2106e
create_dir $path_target
create_dir $path_target_train
create_dir $path_target_test



## cp -r 20 images of per category (16 categories) of amazon to path_source
<<<<<<< HEAD
cp_or_mv_img_from_to  cp -r 30  ${workpath}amazon/images/   ${path_source}
## cp -r 11 images of per category (16 categories) of webcam to path_target
cp_or_mv_img_from_to  cp -r 11  ${workpath}webcam/images/   ${path_target}
cp -r $path_target*    $path_target_test
cp -r $path_source*    $path_source_test
cp_or_mv_img_from_to  mv -f 20  ${path_source_test}  ${path_source_train}
cp_or_mv_img_from_to  mv -f  1  ${path_target_test}  ${path_target_train}


#for cate in ${cate_arr[*]}
#do
#    create_dir ${path_target_train}${cate}/
#	mv ${path_target_test}${cate}/frame_0001.jpg ${path_target_train}${cate}/
#done
=======
cp_img_from_to  20  ${workpath}amazon/images/   ${path_source}
## cp -r 11 images of per category (16 categories) of webcam to path_target
cp_img_from_to  11  ${workpath}webcam/images/   ${path_target}
##### first create path_target_test data set    10  images
cp -r $path_target*    $path_target_test
##### then  create path_target_train data set    1  images
for cate in ${cate_arr[*]}
do
    create_dir ${path_target_train}${cate}/
	mv ${path_target_test}${cate}/frame_0001.jpg ${path_target_train}${cate}/
done
>>>>>>> 22b64def45f9776969700b9cb23bb657a4a2106e



## resize pictures 
echo '  resize images to             299   '
python ./resize_all_images.py --dataset_path $workpath  --size 299


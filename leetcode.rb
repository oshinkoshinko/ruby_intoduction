#for文 for 変数 in オブジェクト　→処理
def running_sum(nums)
    return_array=[]
    counter=0
    for i in 0...nums.length
        return_array<<counter+=nums[i] 
    end
    return return_array
end

a = [1,2,3,4,5]
p running_sum(a)